package com.xt.ares.commands

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Rect
import android.graphics.RectF
import com.xt.ares.ARESCommand
import com.xt.ares.ARESImage
import com.xt.ares.ARESView

class ARESDrawImageCommand(val image: ARESImage,
                           val dx: Double,
                           val dy: Double,
                           val dw: Double,
                           val dh: Double,
                           val sx: Double,
                           val sy: Double,
                           val sw: Double,
                           val sh: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        val bitmap = this.image.bitmap ?: return
        if (this.dx.isNaN() || this.dx.isNaN()) {
            return
        }
        if (!this.sx.isNaN() && !this.sy.isNaN() && !this.sw.isNaN() && !this.sh.isNaN() && !this.dw.isNaN() && !this.dh.isNaN()) {
            if (this.sw <= 0.0 || this.sh <= 0.0) {
                return
            }
            canvas.drawBitmap(
                    bitmap,
                    Rect(this.sx.toInt(), this.sy.toInt(), (this.sx + this.sw).toInt(), (this.sy + this.sh).toInt()),
                    RectF(this.dx.toFloat(), this.dy.toFloat(), (this.dx + this.dw).toFloat(), (this.dy + this.dh).toFloat()),
                    view.currentPaint)
        }
        else {
            if (!this.dw.isNaN() && !this.dh.isNaN()) {
                canvas.drawBitmap(
                        bitmap,
                        Rect(0, 0, bitmap.width, bitmap.height),
                        RectF(this.dx.toFloat(), this.dy.toFloat(), (this.dx + this.dw).toFloat(), (this.dy + this.dh).toFloat()),
                        view.currentPaint)
            }
            else {
                canvas.drawBitmap(bitmap, this.dx.toFloat(), this.dy.toFloat(), view.currentPaint)
            }
        }
    }

}