package com.xt.ares

import android.graphics.Path
import android.graphics.RectF
import kotlin.math.*

class ARESPath: Path() {

    var currentX: Float = 0.0f
        private set

    var currentY: Float = 0.0f
        private set

    private var startX: Float? = null
    private var startY: Float? = null

    override fun reset() {
        super.reset()
        this.startX = null
        this.startY = null
    }

    override fun moveTo(x: Float, y: Float) {
        super.moveTo(x, y)
        this.currentX = x
        this.currentY = y
    }

    override fun lineTo(x: Float, y: Float) {
        super.lineTo(x, y)
        if (this.startX == null) {
            this.startX = this.currentX
        }
        if (this.startY == null) {
            this.startY = this.currentY
        }
        this.currentX = x
        this.currentY = y
    }

    override fun cubicTo(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float) {
        super.cubicTo(x1, y1, x2, y2, x3, y3)
        if (this.startX == null) {
            this.startX = this.currentX
        }
        if (this.startY == null) {
            this.startY = this.currentY
        }
        this.currentX = x3
        this.currentY = y3
    }

    override fun quadTo(x1: Float, y1: Float, x2: Float, y2: Float) {
        super.quadTo(x1, y1, x2, y2)
        if (this.startX == null) {
            this.startX = this.currentX
        }
        if (this.startY == null) {
            this.startY = this.currentY
        }
        this.currentX = x2
        this.currentY = y2
    }

    override fun addArc(oval: RectF?, startAngle: Float, sweepAngle: Float) {
        super.addArc(oval, startAngle, sweepAngle)
        oval?.let { oval ->
            this.currentX = (oval.centerX() + oval.width() / 2.0 * cos(startAngle + sweepAngle)).toFloat()
            this.currentY = (oval.centerY() + oval.height() / 2.0 * sin(startAngle + sweepAngle)).toFloat()
        }
    }

    override fun arcTo(oval: RectF?, startAngle: Float, sweepAngle: Float) {
        super.arcTo(oval, startAngle, sweepAngle)
        oval?.let { oval ->
            this.currentX = (oval.centerX() + oval.width() / 2.0 * cos(startAngle + sweepAngle)).toFloat()
            this.currentY = (oval.centerY() + oval.height() / 2.0 * sin(startAngle + sweepAngle)).toFloat()
        }
    }

    fun addArcToPoint(x1: Float, y1: Float, x2: Float, y2: Float, r: Float) {
        val lastX = this.currentX
        val lastY = this.currentY
        val alpha1 = atan2(lastY - y1, lastX - x1)
        val alpha2 = atan2(y2 - y1, x2 - x1)
        val alpha = angle(alpha1 - alpha2)
        val d = r / abs(sin(alpha / 2))
        val cx = x1 + d * cos(alpha1 - alpha / 2)
        val cy = y1 + d * sin(alpha1 - alpha / 2)

        val clockwise = alpha > 0
        val startAngle = alpha1.radToDeg.toFloat() + (if (clockwise) 1 else -1) * 90f
        val sweepAngle =
                if (clockwise)
                    360 - ((180f + alpha.radToDeg.toFloat()) % 360f)
                else
                    (-180f - alpha.radToDeg.toFloat()) % 360f
        this.moveTo(lastX, lastY)
        this.arcTo(
                RectF((cx - r), (cy - r), (cx + r), (cy + r)),
                startAngle,
                sweepAngle)
    }

    override fun close() {
        super.close()
        this.currentX = this.startX ?: this.currentX
        this.currentY = this.startY ?: this.currentY
    }



}

private val Number.radToDeg: Double
    get() = this.toDouble() * 180 / PI

private fun angle(alpha: Float): Float = when {
    alpha > Math.PI -> ((alpha - 2 * Math.PI).toFloat())
    alpha < -Math.PI -> ((2 * Math.PI + alpha).toFloat())
    else -> alpha
}