package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESFillRectCommand(val x: Double, val y: Double, val w: Double, val h: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.color = view.currentPaint.fillColor
        view.currentPaint.style = Paint.Style.FILL
        canvas.drawRect(x.toFloat(), y.toFloat(), x.toFloat() + w.toFloat(), y.toFloat() + h.toFloat(), view.currentPaint)
        if (ARESGlobalCompositeOperationCommand.savedLayer) {
            ARESGlobalCompositeOperationCommand.restoreLayer(view, canvas)
        }
    }

}