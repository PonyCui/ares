package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Paint
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESTextAlignCommand(val value: String): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        when (this.value) {
            "left" -> view.currentTextPaint.textAlign = Paint.Align.LEFT
            "start" -> view.currentTextPaint.textAlign = Paint.Align.LEFT
            "center" -> view.currentTextPaint.textAlign = Paint.Align.CENTER
            "right" -> view.currentTextPaint.textAlign = Paint.Align.RIGHT
            "end" -> view.currentTextPaint.textAlign = Paint.Align.RIGHT
        }

    }

}