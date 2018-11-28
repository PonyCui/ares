package com.xt.ares

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
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
    internal val currentPaint = Paint()

    @JvmOverloads
    constructor(context:Context, attributeSet: AttributeSet? = null, defStyleAttr: Int = 0): super(context, attributeSet, defStyleAttr) { }

    init {
        this.jsContext.optimizationLevel = -1
        this.jsScope = this.jsContext.initStandardObjects()
        this.bridge.setupContext()
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

    fun addCommand(command: ARESCommand) {
        this.commands.add(command)
        this.invalidate()
    }

    override fun draw(canvas: Canvas?) {
        super.draw(canvas)
        canvas?.let { canvas ->
            canvas.save()
            canvas.scale(this.resources.displayMetrics.density, this.resources.displayMetrics.density)
            this.commands.forEach { it.draw(this, canvas) }
            canvas.restore()
        }
    }

}