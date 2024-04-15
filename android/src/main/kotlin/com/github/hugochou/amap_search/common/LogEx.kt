package com.github.hugochou.amap_search.common

import android.util.Log
import io.flutter.BuildConfig

fun Any.log(content: String) {
    if (BuildConfig.DEBUG) {
        Log.d(this::class.simpleName, content)
    }
}