package com.xt.ares.commands

import com.xt.ares.ARESCommand
import android.R.attr.y
import android.R.attr.x
import android.graphics.RectF
import android.R.attr.x
import android.R.attr.y
import android.graphics.Canvas
import com.xt.ares.ARESView
import java.lang.Math.atan2


class ARESArcToCommand(val x1: Double, val y1: Double, val x2: Double, val y2: Double, val radius: Double): ARESCommand() {

    init {
        ARESBeginPathCommand.sharedPath.addArcToPoint(x1.toFloat(), y1.toFloat(), x2.toFloat(), y2.toFloat(), radius.toFloat())
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.addArcToPoint(x1.toFloat(), y1.toFloat(), x2.toFloat(), y2.toFloat(), radius.toFloat())
    }

}