package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Color
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import com.xt.ares.common.ARESColorUtils

class ARESShadowCommand(val x: Double, val y: Double, val blur: Double, val colorString: String): ARESCommand() {

    var color: Int = 0
        private set

    init {
        this.color = ARESColorUtils.parseColorWithValue(this.colorString)
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.setShadowLayer(if (this.blur <= 0.0) 0.01f else this.blur.toFloat(), this.x.toFloat(), this.y.toFloat(), this.color)
        view.currentTextPaint.setShadowLayer(if (this.blur <= 0.0) 0.01f else this.blur.toFloat(), this.x.toFloat(), this.y.toFloat(), this.color)
    }

}