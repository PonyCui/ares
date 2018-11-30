package com.xt.ares

import android.graphics.PathMeasure
import android.graphics.Region
import com.xt.ares.commands.*
import org.mozilla.javascript.ScriptableObject
import android.R.attr.path
import android.graphics.RectF



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
        this.defineFunctionProperties(arrayOf(
                "fillRect",
                "strokeRect",
                "clearRect",
                "beginPath",
                "closePath",
                "stroke",
                "fill",
                "lineTo",
                "moveTo",
                "rect",
                "quadraticCurveTo",
                "bezierCurveTo",
                "arc",
                "arcTo",
                "clip",
                "isPointInPath"
                ), ARESJSEnvContext::class.java, 0)
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

    fun beginPath() {
        this.view.addCommand(ARESBeginPathCommand())
    }

    fun closePath() {
        this.view.addCommand(ARESClosePathCommand())
    }

    fun stroke() {
        this.view.addCommand(ARESStrokeCommand())
    }

    fun fill() {
        this.view.addCommand(ARESFillCommand())
    }

    fun lineTo(x: Double, y: Double) {
        this.view.addCommand(ARESLineToCommand(x, y))
    }

    fun moveTo(x: Double, y: Double) {
        this.view.addCommand(ARESMoveToCommand(x, y))
    }

    fun rect(x: Double, y: Double, w: Double, h: Double) {
        this.view.addCommand(ARESRectCommand(x, y, w, h))
    }

    fun quadraticCurveTo(cpx: Double, cpy: Double, x: Double, y: Double) {
        this.view.addCommand(ARESQuadraticCurveToCommand(cpx, cpy, x, y))
    }

    fun bezierCurveTo(cp1x: Double, cp1y: Double, cp2x: Double, cp2y: Double, x: Double, y: Double) {
        this.view.addCommand(ARESBezierCurveToCommand(cp1x, cp1y, cp2x, cp2y, x, y))
    }

    fun arc(x: Double, y: Double, r: Double, start: Double, end: Double, anticlockwise: Boolean) {
        this.view.addCommand(ARESArcCommand(x, y, r, start, end, anticlockwise))
    }

    fun arcTo(x1: Double, y1: Double, x2: Double, y2: Double, radius: Double) {
        this.view.addCommand(ARESArcToCommand(x1, y1, x2, y2, radius))
    }

    fun clip() {
        this.view.addCommand(ARESClipCommand())
    }

    fun isPointInPath(x: Double, y: Double): Boolean {
        val rectF = RectF()
        ARESBeginPathCommand.sharedPath.computeBounds(rectF, true)
        val region = Region()
        region.setPath(ARESBeginPathCommand.sharedPath, Region(rectF.left.toInt(), rectF.top.toInt(), rectF.right.toInt(), rectF.bottom.toInt()))
        return region.contains(x.toInt(), y.toInt())
    }


}