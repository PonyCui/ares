package com.xt.ares

import com.xt.ares.commands.*
import org.mozilla.javascript.ScriptableObject

class ARESJSEnvContext(val view: ARESView): ScriptableObject() {

    init {
        this.defineProperty(
                "globalAlpha",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getGlobalAlpha"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setGlobalAlpha", Double::class.java),
                0)
        this.defineProperty(
                "fillStyle",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getFillStyle"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setFillStyle", String::class.java),
                0)
        this.defineProperty(
                "strokeStyle",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getStrokeStyle"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setStrokeStyle", String::class.java),
                0)
        this.defineProperty(
                "lineWidth",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getLineWidth"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setLineWidth", Double::class.java),
                0)
        this.defineProperty(
                "lineCap",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getLineCap"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setLineCap", String::class.java),
                0)
        this.defineProperty(
                "lineJoin",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getLineJoin"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setLineJoin", String::class.java),
                0)
        this.defineProperty(
                "miterLimit",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getMiterLimit"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setMiterLimit", Double::class.java),
                0)
        this.defineFunctionProperties(arrayOf("fillRect", "strokeRect", "clearRect"), ARESJSEnvContext::class.java, 0)
        print(true)
    }

    override fun getClassName(): String {
        return "Context"
    }

    var globalAlpha: Double = 1.0
        set(value) {
            field = value
            this.view.addCommand(ARESGlobalAlphaCommand(value))
        }

    var fillStyle: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESFillStyleCommand(value))
        }

    var strokeStyle: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESStrokeStyleCommand(value))
        }

    var lineWidth: Double = 1.0
        set(value) {
            field = value
            this.view.addCommand(ARESLineWidthCommand(value))
        }

    var lineCap: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESLineCapCommand(value))
        }

    var lineJoin: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESLineJoinCommand(value))
        }

    var miterLimit: Double = 0.0
        set(value) {
            field = value
            this.view.addCommand(ARESMiterLimitCommand(value))
        }

    fun fillRect(x: Double, y: Double, w: Double, h: Double) {
        this.view.addCommand(ARESFillRectCommand(x, y, w, h))
    }

    fun strokeRect(x: Double, y: Double, w: Double, h: Double) {
        this.view.addCommand(ARESStrokeRectCommand(x, y, w, h))
    }

    fun clearRect(x: Double, y: Double, w: Double, h: Double) {
        this.view.addCommand(ARESClearRectCommand(x, y, w, h))
    }

}