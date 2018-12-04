package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESStrokeTextCommand(val text: String, val x: Double, val y: Double, val maxWidth: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentTextPaint.color = view.currentPaint.strokeColor
        view.currentTextPaint.style = Paint.Style.STROKE
        view.currentTextPaint.strokeWidth = view.currentPaint.strokeWidth
        var drawX = this.x.toFloat()
        var drawY = this.y.toFloat()
        ARESTextBaselineCommand.currentBaselineCommand?.let {
            when (it.value) {
                "top" -> {
                    drawY = this.y.toFloat() - view.currentTextPaint.ascent()
                }
                "middle" -> {
                    val lineHeight = -view.currentTextPaint.ascent() + view.currentTextPaint.descent()
                    drawY = this.y.toFloat() + (this.y.toFloat() - lineHeight / 2.0f)
                }
                "bottom" -> {
                    drawY = this.y.toFloat() - view.currentTextPaint.descent()
                }
            }
        }
        val textWidth = view.currentTextPaint.measureText(text)
        if (!this.maxWidth.isNaN() && textWidth > this.maxWidth) {
            canvas.save()
            canvas.translate(drawX, 0f)
            canvas.scale(this.maxWidth.toFloat() / textWidth,  1.0f)
            canvas.drawText(this.text, 0.0f, drawY, view.currentTextPaint)
            canvas.restore()
        }
        else {
            canvas.drawText(this.text, drawX, drawY, view.currentTextPaint)
        }
        if (ARESGlobalCompositeOperationCommand.savedLayer) {
            ARESGlobalCompositeOperationCommand.restoreLayer(view, canvas)
        }
    }

}
