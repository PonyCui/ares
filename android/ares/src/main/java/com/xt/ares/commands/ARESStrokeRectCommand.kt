package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESStrokeRectCommand(val x: Double, val y: Double, val w: Double, val h: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.color = view.currentPaint.strokeColor
        view.currentPaint.style = Paint.Style.STROKE
        canvas.drawRect(x.toFloat(), y.toFloat(), x.toFloat() + w.toFloat(), y.toFloat() + h.toFloat(), view.currentPaint)
        if (ARESGlobalCompositeOperationCommand.savedLayer) {
            ARESGlobalCompositeOperationCommand.restoreLayer(view, canvas)
        }
    }

}