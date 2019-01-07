package com.xt.ares.common

import android.graphics.Color

object ARESColorUtils {

    open fun parseColorWithValue(value: String): Int {

        var valueRemoveSpace = value.replace(" ", "", false)
        if (valueRemoveSpace.contains("rgb", true)) {
            return parseRGBColorWithValue(value)
        } else if (valueRemoveSpace.contains("#")) {
            return parseHEXColorWithValue(value)
        }
        return Color.parseColor(valueRemoveSpace)
    }

    private fun parseRGBColorWithValue(value: String): Int {
        return 0
    }

    private fun parseHEXColorWithValue(value: String): Int {

        var colorString = value.replace("#", "")
//        val hexPattern = "^#([a-f0-9]{6})([a-f0-9]{2})?$".toRegex()
//        hexPattern.find(value)?.let {
//        }
        colorString = when(colorString.length) {
            // #RGB
            3 -> "" + colorString[0] + colorString[0] + colorString[1] + colorString[1] + colorString[2] + colorString[2]

            // #RGBA
            4 -> "" + colorString.last() + colorString.last() + colorString[0] + colorString[0] + colorString[1] + colorString[1] + colorString[2] + colorString[2]

            // #RRGGBB
            // 6 -> return 0

            // #RRGGBBAA
            8 -> colorString.substring(colorString.lastIndex - 1) + colorString.substring(0, colorString.lastIndex - 1)

            else -> colorString
        }
        return Color.parseColor("#" + colorString)
    }
}