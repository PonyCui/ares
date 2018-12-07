package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESFillStyleCommand(value: Any): ARESCommand() {

    var color: Int = Color.BLACK
        private set

    var patternCommand: ARESCreatePatternCommand? = null

    init {
        (value as? String)?.let {
            this.parseStaticValue(it)
        }
        (value as? ARESCreatePatternCommand)?.let {
            this.patternCommand = value
        }
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
        this.patternCommand?.let {
            view.currentPaint.fillPattern = it
            view.currentPaint.fillColor = Color.BLACK
        } ?: kotlin.run {
            view.currentPaint.fillPattern = null
            view.currentPaint.fillColor = this.color
        }
    }

}