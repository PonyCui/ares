package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESRestoreCommand: ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.restore(canvas)
    }

}