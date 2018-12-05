package com.xt.ares.commands

import android.graphics.Canvas
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESTextBaselineCommand(val value: String): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        currentBaselineCommand = this
    }

    companion object {

        var currentBaselineCommand: ARESTextBaselineCommand? = null

    }

}