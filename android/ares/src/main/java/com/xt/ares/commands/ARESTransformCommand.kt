package com.xt.ares.commands

import android.graphics.Canvas
import android.graphics.Matrix
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

private val sharedMatrix = Matrix()
private val floatArray = FloatArray(9)

class ARESTransformCommand(val a: Double, val b: Double, val c: Double, val d: Double, val tx: Double, val ty: Double): ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        sharedMatrix.reset()
        floatArray[0] = this.a.toFloat()
        floatArray[1] = this.c.toFloat()
        floatArray[2] = this.tx.toFloat()
        floatArray[3] = this.b.toFloat()
        floatArray[4]=  this.d.toFloat()
        floatArray[5] = this.ty.toFloat()
        floatArray[8] = 1.0f
        sharedMatrix.setValues(floatArray)
        canvas.concat(sharedMatrix)
    }

}