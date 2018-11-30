package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Path
import com.xt.ares.ARESCommand
import com.xt.ares.ARESPath
import com.xt.ares.ARESView

class ARESBeginPathCommand: ARESCommand() {

    init {
        sharedPath.reset()
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPath.reset()
    }

    companion object {

        val sharedPath = ARESPath()

    }

}