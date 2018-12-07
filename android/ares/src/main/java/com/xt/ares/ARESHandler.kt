package com.xt.ares

import org.mozilla.javascript.Function
import org.mozilla.javascript.NativeObject
import org.mozilla.javascript.ScriptableObject
import java.lang.Exception

class ARESHandler(val view: ARESView, val scope: ScriptableObject?) {

    fun invokeMethod(method: String, arguments: Array<Any> = emptyArray()) {
        try {
            (scope?.get(method) as? Function)?.let {
                it.call(view.jsContext, scope, scope, arguments)
                view.update()
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

}