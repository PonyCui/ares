package com.xt.ares

import android.view.Choreographer
import org.mozilla.javascript.Context
import org.mozilla.javascript.Function
import org.mozilla.javascript.ScriptableObject
import java.util.*

private class ARESHelper: ScriptableObject() {

    val animationFrameHanlder: HashMap<String, Boolean> = hashMapOf()

    init {
        this.defineFunctionProperties(arrayOf(
                "requestAnimationFrame"
        ), ARESHelper::class.java, 0)
    }

    override fun getClassName(): String {
        return "ARESHelper"
    }

    fun requestAnimationFrame(callback: Function): String {
        val jsContext = Context.getCurrentContext() ?: return ""
        val handler = UUID.randomUUID().toString()
        Choreographer.getInstance().postFrameCallback {
            if (this.animationFrameHanlder[handler] == true) {
                this.animationFrameHanlder.remove(handler)
                return@postFrameCallback
            }
            callback.call(jsContext, callback, callback, arrayOf())
            jsContext.evaluateString(callback, "__ctx.update()", "noname.js", 0, null)
        }
        return handler
    }

    fun cancelAnimationFrame(handler: String) {
        this.animationFrameHanlder[handler] = true
    }

}

class ARESJSBridge(val context: Context, val view: ARESView) {

    fun setupContext() {
        context.evaluateString(view.jsScope, "var Image = function() { return new com.xt.ares.ARESImage(); }", "noname.js", 0, null)
        context.evaluateString(view.jsScope, "var helper = new com.xt.ares.ARESHelper(); var requestAnimationFrame = helper.requestAnimationFrame;", "noname.js", 0, null)
    }

}