package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESLineToCommand(val x: Double, val y: Double): ARESCommand() {

    init {
        ARESBeginPathCommand.sharedPath.lineTo(x.toFloat(), y.toFloat())
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.lineTo(x.toFloat(), y.toFloat())
    }

}