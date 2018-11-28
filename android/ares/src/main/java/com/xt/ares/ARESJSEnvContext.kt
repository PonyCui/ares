package com.xt.ares

import com.xt.ares.commands.ARESFillRectCommand
import com.xt.ares.commands.ARESFillStyleCommand
import org.mozilla.javascript.ScriptableObject

class ARESJSEnvContext(val view: ARESView): ScriptableObject() {

    init {
        this.defineProperty(
                "fillStyle",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getFillStyle"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setFillStyle", String::class.java),
                0)
        this.defineFunctionProperties(arrayOf("fillRect"), ARESJSEnvContext::class.java, 0)
        print(true)
    }

    override fun getClassName(): String {
        return "Context"
    }

    var fillStyle: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESFillStyleCommand(value))
        }

    fun fillRect(x: Double, y: Double, w: Double, h: Double) {
        this.view.addCommand(ARESFillRectCommand(x, y, w, h))
    }

}