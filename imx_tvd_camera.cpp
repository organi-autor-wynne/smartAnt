#include "imx_tvd_camera.h"
#include "imagestream.h"

#include <errno.h>
#include <sys/ioctl.h>

#include <QDebug>

IMXTVDCamera::IMXTVDCamera(QObject *parent)
    : Camera(parent)
{
    CAPTURE_DEVICE = "/dev/video0";
    m_image = new ImageStream(720, 480);//576);
    m_playChannel = PLAY_CHANNEL_0;
}

int IMXTVDCamera::subInitCapture()
{
    int err, fd = videodev.fd;

    vidioc_enuminput(fd);
	v4l2_std_id id = 0;

while(1)
{
    int input = 1;
    if ((err = ioctl(fd, VIDIOC_S_INPUT, &input)) < 0) {
        qWarning() << "VIDIOC_S_INPUT error" << errno;
        return -1;
    }

    if ((err = ioctl(fd, VIDIOC_G_STD, &id)) < 0) {
        qWarning() << "VIDIOC_G_STD error" << errno;
        return -1;
    }
    switch (id) {
    case V4L2_STD_ALL:
        qDebug() << "no camera";
        break;
    case V4L2_STD_NTSC:
	//m_image = new ImageStream(720, 480);//576);
        qDebug() << "NTSC camera detected";
        break;
    case V4L2_STD_PAL:
	//m_image = new ImageStream(720, 576);
        qDebug() << "PAL camera detected";
        break;
    default:
        qDebug() << "unknown std";
        break;
    }

	if( id == V4L2_STD_ALL )
	{
		 qDebug() << "v4l2 capture null";
		 m_capture_format = false;
	}
	else
	{
		 m_capture_format = true;
		 break;
	}
	
	sleep(1);
}
    if ((err = ioctl(fd, VIDIOC_S_STD, &id)) < 0) {
        qWarning() << "VIDIOC_S_STD error" << errno;
        return -1;
    }

    struct v4l2_crop crop;
    struct v4l2_cropcap cropcap;
    memset(&cropcap, 0, sizeof(cropcap));
    cropcap.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    if ((err = ioctl(fd, VIDIOC_CROPCAP, &cropcap)) < 0) {
        crop.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        crop.c = cropcap.defrect; /* reset to default */

        if ((err = ioctl(fd, VIDIOC_S_CROP, &crop)) < 0)
            qWarning() << "VIDIOC_S_CROP error" << errno;
    }

    struct v4l2_streamparm parm;
    parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    parm.parm.capture.timeperframe.numerator = 1;
    parm.parm.capture.timeperframe.denominator = 0;
	parm.parm.capture.capturemode = 0;
    parm.parm.capture.reserved[0] = m_playChannel;
	if ((err = ioctl(fd, VIDIOC_S_PARM, &parm)) < 0) {
        qWarning() << "VIDIOC_S_PARM error" << errno;
        return -1;
    }

    struct v4l2_format fmt;
    memset(&fmt, 0, sizeof(fmt));
    fmt.type                = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    fmt.fmt.pix.width       = 0;
    fmt.fmt.pix.height      = 0;
    fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
    fmt.fmt.pix.field       = V4L2_FIELD_INTERLACED;
    if ((err = ioctl(fd, VIDIOC_S_FMT, &fmt)) < 0) {
        qWarning() << "VIDIOC_S_FMT error" << errno;
        return -1;
    }

    /* Note VIDIOC_S_FMT may change width and height. */

    /* Buggy driver paranoia. */
    uint min = fmt.fmt.pix.width * 2;
    if (fmt.fmt.pix.bytesperline < min)
        fmt.fmt.pix.bytesperline = min;

    min = fmt.fmt.pix.bytesperline * fmt.fmt.pix.height;
    if (fmt.fmt.pix.sizeimage < min)
        fmt.fmt.pix.sizeimage = min;

    if ((err = ioctl(fd, VIDIOC_G_FMT, &fmt)) < 0) {
        qWarning() << "VIDIOC_G_FMT error" << errno;
        return -1;
    }

    videodev.cap_width = fmt.fmt.pix.width;
    videodev.cap_height = fmt.fmt.pix.height;
    qDebug() << "cap w =" << videodev.cap_width << " h =" << videodev.cap_height;

    return 0;
}

void IMXTVDCamera::textureProcess(const uchar *data, int width, int height)
{
    m_image->uyvy2rgb(data, width, height);
}
