package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.RectF
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import kotlin.math.*

class ARESArcCommand(val x: Double, val y: Double, val r: Double, val start: Double, val end: Double, val anticlockwise: Boolean): ARESCommand() {

    init {
        val startAngle = start.toFloat() * 180.0 / Math.PI
        val sweepAngle = if (!anticlockwise) (end.toFloat() * 180.0 / Math.PI - startAngle) else (startAngle - end.toFloat() * 180.0 / Math.PI)
        if (ceil(startAngle - sweepAngle) % 360 == 0.0 || floor(startAngle - sweepAngle) % 360 == 0.0) {
            ARESBeginPathCommand.sharedPath.addArc(RectF(
                    x.toFloat() - r.toFloat(),
                    y.toFloat() - r.toFloat(),
                    x.toFloat() + r.toFloat(),
                    y.toFloat() + r.toFloat()
            ), startAngle.toFloat(), sweepAngle.toFloat())
        }
        else {
            ARESBeginPathCommand.sharedPath.arcTo(RectF(
                    x.toFloat() - r.toFloat(),
                    y.toFloat() - r.toFloat(),
                    x.toFloat() + r.toFloat(),
                    y.toFloat() + r.toFloat()
            ), startAngle.toFloat(), sweepAngle.toFloat())
        }
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        val startAngle = start.toFloat() * 180.0 / Math.PI
        val sweepAngle = if (!anticlockwise) (end.toFloat() * 180.0 / Math.PI - startAngle) else (startAngle - end.toFloat() * 180.0 / Math.PI)
        if (ceil(startAngle - sweepAngle) % 360 == 0.0 || floor(startAngle - sweepAngle) % 360 == 0.0) {
            view.currentPath.addArc(RectF(
                    x.toFloat() - r.toFloat(),
                    y.toFloat() - r.toFloat(),
                    x.toFloat() + r.toFloat(),
                    y.toFloat() + r.toFloat()
            ), startAngle.toFloat(), sweepAngle.toFloat())
        }
        else {
            view.currentPath.arcTo(RectF(
                    x.toFloat() - r.toFloat(),
                    y.toFloat() - r.toFloat(),
                    x.toFloat() + r.toFloat(),
                    y.toFloat() + r.toFloat()
            ), startAngle.toFloat(), sweepAngle.toFloat())
        }
    }


}