package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESStrokeStyleCommand(value: String): ARESCommand() {

    var color: Int = 0
        private set

    init {
        this.parseStaticValue(value)
    }

    fun parseStaticValue(value: String) {
        this.color = when (value) {
            "red" -> Color.RED
            "yellow" -> Color.YELLOW
            else -> 0
        }
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.strokeColor = this.color
    }

}