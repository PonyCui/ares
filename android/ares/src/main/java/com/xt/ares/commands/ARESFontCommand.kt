package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Typeface
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

var aresStateFont: ARESFontCommand? = null

class ARESFontCommand(val value: String): ARESCommand() {

    var textSize: Float = 10.0f
    var typeface: Typeface? = null

    init {
        this.parse()
        aresStateFont = this
    }

    private fun parse() {
        if (value.contains("px")) {
            var fontSize: Float = 10f
            var fontFamily: String? = null
            value.split(" ").forEach {
                if (it.endsWith("px")) {
                    fontSize = it.replace("px", "").toFloatOrNull() ?: 10f
                }
                else {
                    fontFamily = it
                }
            }
            this.textSize = fontSize
            fontFamily?.let {
                this.typeface = Typeface.create(it, Typeface.NORMAL)
            }
        }
    }

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentTextPaint.textSize = this.textSize
        view.currentTextPaint.typeface = this.typeface
    }

}