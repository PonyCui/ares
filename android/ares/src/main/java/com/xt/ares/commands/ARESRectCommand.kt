package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Path
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESRectCommand(val x: Double, val y: Double, val w: Double, val h: Double): ARESCommand() {

    init {
        ARESBeginPathCommand.sharedPath.addRect(x.toFloat(), y.toFloat(), x.toFloat() + w.toFloat(), y.toFloat() + h.toFloat(), Path.Direction.CW)
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.addRect(x.toFloat(), y.toFloat(), x.toFloat() + w.toFloat(), y.toFloat() + h.toFloat(), Path.Direction.CW)
    }

}