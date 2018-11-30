package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESQuadraticCurveToCommand(val cpx: Double, val cpy: Double, val x: Double, val y: Double): ARESCommand() {

    init {
        ARESBeginPathCommand.sharedPath.quadTo(cpx.toFloat(), cpy.toFloat(), x.toFloat(), y.toFloat())
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.quadTo(cpx.toFloat(), cpy.toFloat(), x.toFloat(), y.toFloat())
    }

}