package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import kotlin.math.max
import kotlin.math.min

class ARESGlobalAlphaCommand(val value: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.alpha = max(0, min(255, (value * 255.0).toInt()))
    }

}