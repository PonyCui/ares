package com.xt.ares

import android.graphics.Paint
import kotlin.math.max
import kotlin.math.min

class ARESPaint: Paint() {

    var strokeColor: Int = 0
    var fillColor: Int = 0

    override fun setColor(color: Int) {
        val globalAlpha = this.alpha
        super.setColor(color)
        val newAlpha = (this.alpha.toDouble() / 255.0) * (globalAlpha.toDouble() / 255.0)
        this.alpha = max(0, min(255, (newAlpha * 255.0).toInt()))
    }

}