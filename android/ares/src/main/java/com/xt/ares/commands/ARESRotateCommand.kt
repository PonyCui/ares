package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView
import java.lang.Math.PI

class ARESRotateCommand(val angle: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        canvas.rotate((angle * 180.0 / PI).toFloat())
    }

}