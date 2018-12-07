package com.xt.ares.commands

import android.graphics.*
import com.xt.ares.ARESCommand
import com.xt.ares.ARESView

class ARESFillCommand: ARESCommand() {

    override fun draw(view: ARESView, canvas: Canvas) {
        super.draw(view, canvas)
        view.currentPaint.color = view.currentPaint.fillColor
        view.currentPaint.style = Paint.Style.FILL
        view.currentPaint.fillPattern?.let {
            it.image.bitmap?.let { bitmap ->
                view.currentPaint.shader = BitmapShader(bitmap, Shader.TileMode.REPEAT, Shader.TileMode.REPEAT)
                view.currentPaint.color = Color.BLACK
            }
        }
        canvas.drawPath(view.currentPath, view.currentPaint)
        if (ARESGlobalCompositeOperationCommand.savedLayer) {
            ARESGlobalCompositeOperationCommand.restoreLayer(view, canvas)
        }
    }

}