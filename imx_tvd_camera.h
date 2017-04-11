#ifndef IMXTVDCAMERA_H
#define IMXTVDCAMERA_H

#include "camera.h"

class IMXTVDCamera : public Camera
{
public:
    IMXTVDCamera(QObject *parent = 0);

    virtual int subInitCapture();
private:
    virtual void textureProcess(const uchar *data, int width, int height);

};

#endif // IMXTVDCAMERA_H
