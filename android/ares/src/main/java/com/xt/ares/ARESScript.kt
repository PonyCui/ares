package com.xt.ares

import android.content.Context
import java.lang.Exception

class ARESScript(val evalScript: String) {

    companion object {

        @JvmStatic fun decodeFromAssets(context: Context, name: String): ARESScript? {
            try {
                context.assets.open(name).use {
                    val byteArray = ByteArray(it.available())
                    it.read(byteArray)
                    return ARESScript(String(byteArray))
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
            return null
        }

    }

}