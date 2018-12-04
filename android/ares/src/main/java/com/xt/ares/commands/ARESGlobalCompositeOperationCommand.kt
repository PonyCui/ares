package com.xt.ares.commands

import android.graphics.*
import android.os.Build
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESGlobalCompositeOperationCommand(val value: String): ARESCommand() {

    private fun saveLayer(view: ARESView, canvas: Canvas) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            savedLayerStateFlag = canvas.saveLayer(RectF(
                    0f,
                    0f,
                    canvas.width.toFloat(),
                    canvas.height.toFloat()
            ), sharedLayerPaint)
        } else {
            savedLayerStateFlag = canvas.saveLayer(RectF(
                    0f,
                    0f,
                    canvas.width.toFloat(),
                    canvas.height.toFloat()
            ), sharedLayerPaint, Canvas.ALL_SAVE_FLAG)
        }
        savedLayer = true
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
         when (this.value) {
            "source-over" -> {
                sharedLayerPaint.xfermode = null
            }
            "source-atop" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_ATOP)
                this.saveLayer(view, canvas)
            }
            "source-in" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_IN)
                this.saveLayer(view, canvas)
            }
            "source-out" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_OUT)
                this.saveLayer(view, canvas)
            }
            "destination-over" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.DST_OVER)
                this.saveLayer(view, canvas)
            }
            "destination-atop" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.DST_ATOP)
                this.saveLayer(view, canvas)
            }
            "destination-in" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.DST_IN)
                this.saveLayer(view, canvas)
            }
            "destination-out" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.DST_OUT)
                this.saveLayer(view, canvas)
            }
            "lighter" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.LIGHTEN)
                this.saveLayer(view, canvas)
            }
            "darker" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.DARKEN)
                this.saveLayer(view, canvas)
            }
            "xor" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.XOR)
                this.saveLayer(view, canvas)
            }
            "copy" -> {
                sharedLayerPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.SRC)
                this.saveLayer(view, canvas)
            }
else -> null
        }
    }

    companion object {

        var savedLayer = false
            private set

        var savedLayerStateFlag: Int = 0

        private val sharedLayerPaint = Paint()

        fun restoreLayer(view: ARESView, canvas: Canvas) {
            if (this.savedLayer) {
                canvas.restoreToCount(savedLayerStateFlag)
                sharedLayerPaint.xfermode = null
                this.savedLayer = false
            }
        }

    }

}