package com.xt.ares

import org.mozilla.javascript.Context

class ARESJSBridge(val context: Context, val view: ARESView) {

    fun setupContext() {
        context.evaluateString(view.jsScope, "var Image = function() { return new com.xt.ares.ARESImage(); }", "noname.js", 0, null)
    }

}