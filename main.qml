import QtQuick 2.2
import QtQuick.Window 2.1
import CameraPlayer 1.0

Rectangle {
    id: main
    width: 800
    height: 480
    color: "black"
	property int cameraFlag: 0

    Rectangle {
        id:yylu
        x:0
        y:194
        width: 800
        height: 400
        clip:true
        opacity:0.0
        color:"#00000000"

        Image {
            id:lu
            x: 113 - yylu.x
            y: 202 - yylu.y
            source: "qrc:/images/luxian.png"
        }
    }

    Image {
        id: shuguang
        x: 0
        y: 55
        opacity: 0.0
        source: "qrc:/images/shuguang.png"
    }

    Image {
        id: luguang
        x: 18
        y: 163
        opacity: 0.0
        source: "qrc:/images/luguang.png"
    }

    Image {
        id: bj
        x: -18
        y: 63
        scale: 0.0
        anchors.centerIn: parent.Center
        source: "qrc:/images/shu.png"
    }



    FontLoader{
        id: font
        source: "qrc:/BebasNeue.otf"
    }
    property int textSpeed: 0
    property real textRpm: 0


    Item {
        id:hj
        opacity: 0.0


        Image {
            x: -1
            y: 263
            source: "qrc:/images/bottom.png"
        }

		CameraPlayer {
			id: camera
			width: 800
			height: 480
			play: true
			opacity: 0.0
		}

        Image {
            x: 373
            y: 46
            source: "qrc:/images/19_35.png"
        }
        Image {
            x: 346
            y: 386
            source: "qrc:/images/model.png"
        }
        //小里程
        Image {
            x: 641
            y: 428
            source: "qrc:/images/trip.png"
        }
        Image {
            x: 760
            y: 428
            source: "qrc:/images/km.png"
        }
        Image {
            x: 703
            y: 428
            source: "qrc:/images/254.5.png"
        }

        //总里程
        Image {
            x: 12
            y: 427
            source: "qrc:/images/odo.png"
        }
        Image {
            x: 148
            y: 428
            source: "qrc:/images/km.png"
        }
        Image {
            x: 78
            y: 428
            source: "qrc:/images/157585.png"
        }

        //续航里程
        Image {
            x: 273
            y: 431
            source: "qrc:/images/rangeblack.png"
        }
        Image {
            x: 274
            y: 432
            source: "qrc:/images/rangeblue.png"
        }
        Image {
            x: 504
            y: 428
            source: "qrc:/images/km.png"
        }
        Image {
            x: 457
            y: 425
            source: "qrc:/images/248.png"
        }

        //电压
        Image {
            x: 558
            y: 59
            source: "qrc:/images/yellow.png"
        }
        Image {
            x: 491
            y: 53
            source: "qrc:/images/220.png"
        }
        Image {
            x: 537
            y: 56
            source: "qrc:/images/V.png"
        }
        //电流
        Image {
            x: 78
            y: 59
            source: "qrc:/images/yellow.png"
        }
        Image {
            x: 259
            y: 53
            source: "qrc:/images/12.png"
        }
        Image {
            x: 287
            y: 56
            source: "qrc:/images/A.png"
        }

        //warning
        Item {
            id: warning
            Image {
                x: 237
                y: 104
                source: "qrc:/images/warnBg.png"
            }
            Image {
                x: 271
                y: 116
                source: "qrc:/images/warning.png"
            }
            Image {
                id: zuoyitext
                x: 330
                y: 128
                source: "qrc:/images/safebagFault_text.png"
            }
            Image {
                id: zuoyi
                x: 341
                y: 181
                source: "qrc:/images/safebagFault.png"
            }
        }

        //speed
        Image {
            x: 152
            y: 332
            source: "qrc:/images/readyblack.png"
        }
        Image {
            id: ready
            x: 152
            y: 332
            source: "qrc:/images/readygreen.png"
        }
        Image {
            x: 249
            y: 381
            source: "qrc:/images/km_h.png"
		}
        Item {
            x: 118
            y: 358
            width: 127
            height: 41
            Text {
                id: speed
                font.pointSize: 60
                text: textSpeed
                anchors.centerIn: parent
                font.family: font.name
                color: "white"
                opacity: 1.0
            }
        }

        //rpm
        Image {
            x: 614
            y: 382
            opacity: 0.2
            source: "qrc:/images/1000_rpm.png"
		}
        Item {
            x: 510
            y: 359
            width: 100
            height: 41
            Text {
                id: rpm
                font.pointSize: 60
                text: (textRpm * 0.1).toFixed(1)
                anchors.centerIn: parent
                font.family: font.name
                color: "white"
                opacity: 1.0
            }
		}

        //speed disk=================================================
        Image {
            id:diskspeed
            x: -198
            y: 53
            opacity: 0.0
            source: "qrc:/images/disk_speed.png"
        }
        Image {
            id: speed_value
            x: -2
            y: 118
            source: "qrc:/images/value_speed.png"
            transform: Rotation {
                id: speed_valueRotation
                origin.x: -24 - speed_value.x
				origin.y: 226 - speed_value.y
                angle: 98 - 123 * (textSpeed / 220)
            }
        }

        Image {
            id: speed_pointer
            x: 8
            y: 236
            source: "qrc:/images/pointer_speed.png"
            transform: Rotation {
                id: speed_pointerRotation
                origin.x: -24 - speed_pointer.x
                origin.y: 226 - speed_pointer.y
                angle: speed_valueRotation.angle - 72   //26//-97
            }
        }

        //rpm disk==================================================
        Image {
            id:diskrpm
            x: 540
            y: 53
            opacity: 0.0
            source: "qrc:/images/disk_rpm.png"
        }
        Image {
            id: rpm_value
            x: 651
            y: 118
            source: "qrc:/images/value_rpm.png"
            transform: Rotation {
                id: rpm_valueRotation
                origin.x: 824 - rpm_value.x
                origin.y: 226 - rpm_value.y
                //angle: -98
                angle: -98 + 123 * (textRpm / 80)
            }
        }
        Image {
            id: rpm_pointer
            x: 659
            y: 237
            source: "qrc:/images/pointer_rpm.png"
            transform: Rotation {
                id: rpm_pointerRotation
                origin.x: 824 - rpm_pointer.x
                origin.y: 226 - rpm_pointer.y
                angle: rpm_valueRotation.angle + 71 //97
            }
        }

    }

    Image {
		id:zuo1
        y: 45
		x: -53
        opacity: 0.0
        source: "qrc:/images/scale_speed.png"
        transform: Rotation {
            id: zuoZhuan1
            origin.x: 0 - zuo1.x
            origin.y: 226 - zuo1.y
            angle: 0
        }
    }
    Image {
		id:you1
        y: 45
		x: 635
        opacity: 0.0
        source: "qrc:/images/scale_rpm.png"
        transform: Rotation {
            id: youZhuan1
            origin.x: 800 - you1.x
            origin.y: 226 - you1.y
            angle: 0
        }
    }


    Rectangle {
        id:yys
        x:0
        y:25
        width: 800
        height: 66
        clip:true
        opacity:0.0
        color:"#00000000"

        Image {
            id:shang
            x: 16 - yys.x
            y: 45 - yys.y
            source: "qrc:/images/topLine.png"
        }

    }
    Rectangle {
        id:yyx
        x:0
        y:376
        width: 800
        height: 66
        clip:true
        opacity:0.0
        color:"#00000000"

        Image {
            id:xia
            x: 16 - yyx.x
            y: 380 - yyx.y
            source: "qrc:/images/bottomLine.png"
        }
    }




    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        // tui chu
        ParallelAnimation{
            NumberAnimation {target: bj; properties: "opacity,scale"; to: 0.0 ; }
            NumberAnimation {target: yylu; property: "opacity"; to: 0.0; }
            NumberAnimation {target: yylu; property: "y"; to: -206 ; }
            NumberAnimation {target: yys; property: "opacity"; to: 0; }
            NumberAnimation {target: yyx; property: "opacity"; to: 0; }
            NumberAnimation {target: yys; property: "x"; to: -800; }
            NumberAnimation {target: yyx; property: "x"; to: 800; }
            NumberAnimation {target: shuguang; properties: "opacity"; to: 0.0 ; }
            NumberAnimation {target: luguang; properties: "opacity"; to: 0.0 ; }
            NumberAnimation {target: zuo1; property: "opacity"; to: 0; }
            NumberAnimation {target: you1; property: "opacity"; to: 0; }
            NumberAnimation {target: zuoZhuan1; property: "angle"; to: 180; }
            NumberAnimation {target: youZhuan1; property: "angle"; to: 180; }
            NumberAnimation {target: hj; property: "opacity"; to: 0; }
            NumberAnimation {target: diskspeed; property: "opacity"; to: 0; }
            NumberAnimation {target: diskrpm; property: "opacity"; to: 0; }
        }

        ParallelAnimation{
            NumberAnimation {target: bj; properties: "opacity,scale"; to: 1.0 ; duration: 500 }
            NumberAnimation {target: yylu; property: "opacity"; to: 1.0; duration: 1000 }
            NumberAnimation {target: yylu; property: "y"; from: -206 ; to: 194; duration: 1000 }
        }
        SequentialAnimation{
            ParallelAnimation{
                NumberAnimation {target: yys; property: "opacity"; to: 1; duration: 1000 }
                NumberAnimation {target: yyx; property: "opacity"; to: 1; duration: 1000 }
                NumberAnimation {target: yys; property: "x"; from: -800; to: 0; duration: 1000 }
				NumberAnimation {target: yyx; property: "x"; from: 800; to: 0; duration: 1000 }
                NumberAnimation {target: shuguang; properties: "opacity"; to: 1.0 ; duration: 1000 }
                NumberAnimation {target: luguang; properties: "opacity"; to: 1.0 ; duration: 1000 }
            }
        }
        SequentialAnimation{

            ParallelAnimation{
                NumberAnimation {target: zuo1; property: "opacity"; to: 1; duration: 2000 }
                NumberAnimation {target: you1; property: "opacity"; to: 1; duration: 2000 }
                NumberAnimation {target: zuoZhuan1; property: "angle"; from: 180; to: 0; duration: 1000 }
                NumberAnimation {target: youZhuan1; property: "angle"; from: 180; to: 0; duration: 1000 }
                NumberAnimation {target: hj; property: "opacity"; to: 1; duration: 2000 }
                NumberAnimation {target: diskspeed; property: "opacity"; to: 1; duration: 2000 }
                NumberAnimation {target: diskrpm; property: "opacity"; to: 1; duration: 2000 }
            }
        }





        ParallelAnimation{
            SequentialAnimation {
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 1000
                    to: 30
                }
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 1500
                    to: 120
                }
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 3000
                    to: 220
                }
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 1500
                    to: 190
                }
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 1000
                    to: 130
                }
                NumberAnimation {
                    target: main
                    property: "textSpeed"
                    duration: 1500
                    to: 0
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 1000
                    to: 30
                }
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 1500
                    to: 70
                }
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 3000
                    to: 80
                }
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 1500
                    to: 70
                }
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 1000
                    to: 30
                }
                NumberAnimation {
                    target: main
                    property: "textRpm"
                    duration: 1500
                    to: 0
                }
            }
        }


        ScriptAction {
            script: {
                ready.opacity = 0.0;
            }
        }

		NumberAnimation {
			target: main
			property: "cameraFlag"
			duration: 300
			to: 1
		}
		PauseAnimation {
			duration: 2000
		}

        ParallelAnimation {
            NumberAnimation {
                target: warning
                property: "opacity"
                duration: 300
                to: 0.0
            }
            NumberAnimation {
                target: camera
                property: "opacity"
                duration: 300
                to: 1.0
            }
        }

        PauseAnimation {
            duration: 5000
        }

        ScriptAction {
            script: {
                ready.opacity = 1.0;
            }
        }

        ParallelAnimation {
            NumberAnimation {
                target: warning
                property: "opacity"
                duration: 300
                to: 1.0
            }
            NumberAnimation {
                target: camera
                property: "opacity"
                duration: 300
                to: 0.0
            }
        }

		NumberAnimation {
			target: main
			property: "cameraFlag"
			duration: 300
			to: 0
		}

		PauseAnimation {
			duration: 2000
		}

		ParallelAnimation {
			NumberAnimation {
				target: warning
				property: "opacity"
				duration: 300
				to: 0.0
			}
			NumberAnimation {
				target: camera
				property: "opacity"
				duration: 300
				to: 1.0
			}
		}
		PauseAnimation {
			duration: 5000
		}

		ParallelAnimation {
			NumberAnimation {
				target: warning
				property: "opacity"
				duration: 300
				to: 1.0
			}
			NumberAnimation {
				target: camera
				property: "opacity"
				duration: 300
				to: 0.0
			}
		}

	}
}