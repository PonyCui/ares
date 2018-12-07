package com.xt.ares

import android.R.attr.max
import android.graphics.PathMeasure
import android.graphics.Region
import com.xt.ares.commands.*
import org.mozilla.javascript.ScriptableObject
import android.R.attr.path
import android.graphics.RectF
import org.json.JSONObject

class ARESJSEnvContext(val view: ARESView): ScriptableObject() {

    init {
        this.defineProperty(
                "canvas",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getCanvas"),
                null,
                0)
        this.defineProperty(
                "globalAlpha",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getGlobalAlpha"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setGlobalAlpha", Double::class.java),
                0)
        this.defineProperty(
                "globalCompositeOperation",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getGlobalCompositeOperation"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setGlobalCompositeOperation", String::class.java),
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
        this.defineProperty(
                "shadowOffsetX",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getShadowOffsetX"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setShadowOffsetX", Double::class.java),
                0)
        this.defineProperty(
                "shadowOffsetY",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getShadowOffsetY"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setShadowOffsetY", Double::class.java),
                0)
        this.defineProperty(
                "shadowBlur",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getShadowBlur"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setShadowBlur", Double::class.java),
                0)
        this.defineProperty(
                "shadowColor",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getShadowColor"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setShadowColor", String::class.java),
                0)
        this.defineProperty(
                "font",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getFont"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setFont", String::class.java),
                0)
        this.defineProperty(
                "textAlign",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getTextAlign"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setTextAlign", String::class.java),
                0)
        this.defineProperty(
                "textBaseline",
                null,
                ARESJSEnvContext::class.java.getDeclaredMethod("getTextBaseline"),
                ARESJSEnvContext::class.java.getDeclaredMethod("setTextBaseline", String::class.java),
                0)
        this.defineFunctionProperties(arrayOf(
                "save",
                "restore",
                "scale",
                "rotate",
                "translate",
                "transform",
                "setTransform",
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
                "isPointInPath",
                "fillText",
                "strokeText",
                "measureText",
                "drawImage",
                "update"
                ), ARESJSEnvContext::class.java, 0)
    }

    override fun getClassName(): String {
        return "Context"
    }

    var canvas: ARESJSCanvasObject? = null
        get() {
            return ARESJSCanvasObject(this.view, this)
        }

    fun save() {
        this.view.addCommand(ARESSaveCommand())
    }

    fun restore() {
        this.view.addCommand(ARESRestoreCommand())
    }

    fun scale(x: Double, y: Double) {
        this.view.addCommand(ARESScaleCommand(x, y))
    }

    fun rotate(angle: Double) {
        this.view.addCommand(ARESRotateCommand(angle))
    }

    fun translate(x: Double, y: Double) {
        this.view.addCommand(ARESTranslateCommand(x, y))
    }

    fun transform(a: Double, b: Double, c: Double, d: Double, tx: Double, ty: Double) {
        this.view.addCommand(ARESTransformCommand(a, b, c, d, tx, ty))
    }

    fun setTransform(a: Double, b: Double, c: Double, d: Double, tx: Double, ty: Double) {
        this.view.addCommand(ARESSetTransformCommand(a, b, c, d, tx, ty))
    }

    var globalAlpha: Double = 1.0
        set(value) {
            field = value
            this.view.addCommand(ARESGlobalAlphaCommand(value))
        }

    var globalCompositeOperation: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESGlobalCompositeOperationCommand(value))
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

    var shadowOffsetX: Double = 0.0
        set(value) {
            field = value
            this.view.addCommand(ARESShadowCommand(value, this.shadowOffsetY, this.shadowBlur, this.shadowColor))
        }

    var shadowOffsetY: Double = 0.0
        set(value) {
            field = value
            this.view.addCommand(ARESShadowCommand(this.shadowOffsetX, value, this.shadowBlur, this.shadowColor))
        }

    var shadowBlur: Double = 0.0
        set(value) {
            field = value
            this.view.addCommand(ARESShadowCommand(this.shadowOffsetX, this.shadowOffsetY, value, this.shadowColor))
        }

    var shadowColor: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESShadowCommand(this.shadowOffsetX, this.shadowOffsetY, this.shadowBlur, value))
        }

    var font: String = "10px"
        set(value) {
            field = value
            this.view.addCommand(ARESFontCommand(value))
        }

    var textAlign: String = "left"
        set(value) {
            field = value
            this.view.addCommand(ARESTextAlignCommand(value))
        }

    var textBaseline: String = ""
        set(value) {
            field = value
            this.view.addCommand(ARESTextBaselineCommand(value))
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

    fun fillText(text: String, x: Double, y: Double, maxWidth: Double) {
        this.view.addCommand(ARESFillTextCommand(text, x, y, maxWidth))
    }

    fun strokeText(text: String, x: Double, y: Double, maxWidth: Double) {
        this.view.addCommand(ARESStrokeTextCommand(text, x, y, maxWidth))
    }

    fun measureText(text: String): TextMeasureResult {
        aresStateFont?.let {
            view.currentTextPaint.textSize = it.textSize
            view.currentTextPaint.typeface = it.typeface
            return TextMeasureResult(view.currentTextPaint.measureText(text).toDouble())
        }
        return TextMeasureResult(0.0)
    }

    fun drawImage(image: ARESImage, sxOrDx: Double, syOrDy: Double, swOrDw: Double, shOrDh: Double, dx: Double, dy: Double, dw: Double, dh: Double) {
        if (!dx.isNaN()) {
            this.view.addCommand(ARESDrawImageCommand(
                    image,
                    dx,
                    dy,
                    dw,
                    dh,
                    sxOrDx,
                    syOrDy,
                    swOrDw,
                    shOrDh
            ))
        }
        else {
            this.view.addCommand(ARESDrawImageCommand(
                    image,
                    sxOrDx,
                    syOrDy,
                    swOrDw,
                    shOrDh,
                    Double.NaN,
                    Double.NaN,
                    Double.NaN,
                    Double.NaN
            ))
        }
    }

    fun update() {
        this.view.update()
    }

    class TextMeasureResult(val width: Double)

}

class ARESJSCanvasObject(val view: ARESView, val ctx: ARESJSEnvContext): ScriptableObject() {

    init {
        this.defineProperty(
                "width",
                null,
                ARESJSCanvasObject::class.java.getDeclaredMethod("getWidth"),
                null,
                0)
        this.defineProperty(
                "height",
                null,
                ARESJSCanvasObject::class.java.getDeclaredMethod("getHeight"),
                null,
                0)
        this.defineFunctionProperties(arrayOf(
                "getContext"
        ), ARESJSCanvasObject::class.java, 0)
    }

    override fun getClassName(): String {
        return "Canvas"
    }

    var width: Double = 0.0
        get() {
            return (this.view.width / this.view.resources.displayMetrics.density).toDouble()
        }

    var height: Double = 0.0
        get() {
            return (this.view.height / this.view.resources.displayMetrics.density).toDouble()
        }

    fun getContext(): ARESJSEnvContext {
        return this.ctx
    }

}