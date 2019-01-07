package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import com.xt.ares.common.ARESColorUtils

class ARESFillStyleCommand(value: Any): ARESCommand() {

    var color: Int = Color.BLACK
        private set

    var patternCommand: ARESCreatePatternCommand? = null

    init {
        (value as? String)?.let {
            this.color = ARESColorUtils.parseColorWithValue(value)
        }
        (value as? ARESCreatePatternCommand)?.let {
            this.patternCommand = value
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