package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.PorterDuff
import android.graphics.PorterDuffXfermode
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

private val clearPaint = Paint()

class ARESClearRectCommand(val x: Double, val y: Double, val w: Double, val h: Double): ARESCommand() {

    init {
        clearPaint.xfermode = PorterDuffXfermode(PorterDuff.Mode.CLEAR)
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        canvas.drawRect(x.toFloat(), y.toFloat(), x.toFloat() + w.toFloat(), y.toFloat() + h.toFloat(), clearPaint)
    }

}