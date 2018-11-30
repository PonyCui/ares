package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESFillCommand: ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.color = view.currentPaint.fillColor
        view.currentPaint.style = Paint.Style.FILL
        canvas.drawPath(view.currentPath, view.currentPaint)
    }

}