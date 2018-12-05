package com.xt.ares

import android.graphics.Color
import android.graphics.Paint
import kotlin.math.max
import kotlin.math.min

class ARESPaint(paint: ARESPaint? = null): Paint(paint ?: Paint()) {

    var strokeColor: Int = Color.BLACK
    var fillColor: Int = Color.BLACK

    override fun setColor(color: Int) {
        val globalAlpha = this.alpha
        super.setColor(color)
        val newAlpha = (this.alpha.toDouble() / 255.0) * (globalAlpha.toDouble() / 255.0)
        this.alpha = max(0, min(255, (newAlpha * 255.0).toInt()))
    }

    fun clone(): ARESPaint {
        val newPaint = ARESPaint(this)
        newPaint.alpha = this.alpha
        newPaint.strokeColor = this.strokeColor
        newPaint.fillColor = this.fillColor
        return newPaint
    }

}