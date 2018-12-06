package com.xt.ares

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Handler
import android.os.Looper
import org.mozilla.javascript.Context
import org.mozilla.javascript.Function
import org.mozilla.javascript.ScriptableObject
import java.lang.Exception

class ARESImage: ScriptableObject() {

    internal var bitmap: Bitmap? = null

    init {
        this.defineProperty(
                "src",
                null,
                ARESImage::class.java.getDeclaredMethod("getSrc"),
                ARESImage::class.java.getDeclaredMethod("setSrc", String::class.java),
                0)
        this.defineFunctionProperties(arrayOf(

        ), ARESImage::class.java, 0)
    }

    var src: String = ""
        set(value) {
            field = value
            this.loadImage()
        }

    override fun getClassName(): String {
        return "Image"
    }

    fun loadImage() {
        val jsContext = Context.getCurrentContext() ?: return
        Handler(Looper.getMainLooper()).post {
            try {
                ARESView.sharedContext?.let { context ->
                    context.assets.open(this.src).use {
                        BitmapFactory.decodeStream(it)?.let {
                            this.bitmap = it
                            (this.get("onload") as? Function)?.let {
                                it.call(jsContext, it, it, arrayOf())
                                jsContext.evaluateString(it, "__ctx.update()", "noname.js", 0, null)
                            }
                        }
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

}