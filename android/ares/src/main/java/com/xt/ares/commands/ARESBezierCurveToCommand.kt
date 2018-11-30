package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESBezierCurveToCommand(val cp1x: Double, val cp1y: Double, val cp2x: Double, val cp2y: Double, val x: Double, val y: Double): ARESCommand() {

    init {
        ARESBeginPathCommand.sharedPath.cubicTo(cp1x.toFloat(), cp1y.toFloat(), cp2x.toFloat(), cp2y.toFloat(), x.toFloat(), y.toFloat())
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.cubicTo(cp1x.toFloat(), cp1y.toFloat(), cp2x.toFloat(), cp2y.toFloat(), x.toFloat(), y.toFloat())
    }

}