package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESLineJoinCommand(val value: String): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.strokeJoin = when(this.value) {
            "bevel" -> Paint.Join.BEVEL
            "miter" -> Paint.Join.MITER
            "round" -> Paint.Join.ROUND
            else -> null
        }
    }

}