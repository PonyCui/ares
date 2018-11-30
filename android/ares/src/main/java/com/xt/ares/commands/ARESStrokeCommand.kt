package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESStrokeCommand: ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.color = view.currentPaint.strokeColor
        view.currentPaint.style = Paint.Style.STROKE
        canvas.drawPath(view.currentPath, view.currentPaint)
    }

}