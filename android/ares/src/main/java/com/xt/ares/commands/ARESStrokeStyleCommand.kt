package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import com.xt.ares.common.ARESColorUtils

class ARESStrokeStyleCommand(value: String): ARESCommand() {

    var color: Int = 0
        private set

    init {
        this.color = ARESColorUtils.parseColorWithValue(value)
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.strokeColor = this.color
    }

}