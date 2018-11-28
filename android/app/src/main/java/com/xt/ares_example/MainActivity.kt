package com.xt.ares_example

import android.graphics.Color
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.xt.ares.ARESScript
import com.xt.ares.ARESView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val view = ARESView(this)
        view.setBackgroundColor(Color.BLACK)
        ARESScript.decodeFromAssets(this, "drawCircle.js")?.let {
            view.exec(it)?.let {
                view.postDelayed({
                    it.invokeMethod("fillColor", arrayOf("yellow"))
                }, 3000)
            }
        }
        setContentView(view)
    }
}
