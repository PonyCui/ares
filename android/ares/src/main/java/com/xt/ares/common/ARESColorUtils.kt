package com.xt.ares.common

import android.graphics.Color

object ARESColorUtils {

    open fun parseColorWithValue(value: String): Int {
        return Color.parseColor(value)
    }
}