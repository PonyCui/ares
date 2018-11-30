package com.xt.ares

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Path
import android.util.AttributeSet
import android.view.View
import org.mozilla.javascript.Function
import org.mozilla.javascript.ScriptableObject
import java.lang.Exception

class ARESView : View {

    internal val jsContext: org.mozilla.javascript.Context = org.mozilla.javascript.Context.enter()
    internal val jsScope: ScriptableObject
    internal val bridge = ARESJSBridge(jsContext, this)
    internal val commands: MutableList<ARESCommand> = mutableListOf()
    internal val currentPaint = ARESPaint()
    internal val currentPath = ARESPath()
    private var osCanvas: Canvas? = null
    private var osBitmap: Bitmap? = null

    @JvmOverloads
    constructor(context:Context, attributeSet: AttributeSet? = null, defStyleAttr: Int = 0): super(context, attributeSet, defStyleAttr) { }

    init {
        this.jsContext.optimizationLevel = -1
        this.jsScope = this.jsContext.initStandardObjects()
        this.bridge.setupContext()
        this.resetCanvas()
    }

    fun exec(script: ARESScript): ARESHandler? {
        try {
            this.jsContext.evaluateString(this.jsScope, "if (typeof main === 'undefined') { var main = undefined; } else { main = undefined; }", "", 0, null)
            this.jsContext.evaluateString(this.jsScope, script.evalScript, "", 0, null)
            (this.jsScope.get("main") as? Function)?.let {
                return ARESHandler(this, it.call(this.jsContext, it, it, arrayOf(ARESJSEnvContext(this))) as? ScriptableObject)
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return null
    }

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        super.onLayout(changed, left, top, right, bottom)
        if (changed) {
            this.resetCanvas()
        }
    }

    private fun resetCanvas() {
        if (this.width <= 0 || this.height <= 0) {
            this.releaseCanvas()
            return
        }
        this.osBitmap?.takeIf { it.width == this.width && it.height == this.height }?.let {
            return
        }
        val oldImage = this.osBitmap
        this.osBitmap = Bitmap.createBitmap(this.width, this.height, Bitmap.Config.ARGB_8888)
        this.osCanvas = Canvas(this.osBitmap)
        oldImage?.let {
            this.osCanvas?.drawBitmap(it, 0.0f, 0.0f, null)
        }
        this.osCanvas?.scale(this.resources.displayMetrics.density, this.resources.displayMetrics.density)
        this.update()
    }

    private fun releaseCanvas() {
        this.osCanvas = null
        this.osBitmap?.recycle()
        this.osBitmap = null
    }

    fun addCommand(command: ARESCommand) {
        this.commands.add(command)
    }

    fun drawCommands() {
        this.osCanvas?.let { osCanvas ->
            this.commands.forEach {
                it.draw(this, osCanvas)
            }
            this.commands.clear()
        }
    }

    fun update() {
        this.drawCommands()
        this.invalidate()
    }

    override fun draw(canvas: Canvas?) {
        super.draw(canvas)
        canvas?.let { canvas ->
            this.osBitmap?.let { osBitmap ->
                canvas.drawBitmap(osBitmap, 0f, 0f, null)
            }
        }
    }

}