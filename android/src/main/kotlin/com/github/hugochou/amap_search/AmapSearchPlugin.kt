package com.github.hugochou.amap_search

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AmapSearchPlugin */
class AmapSearchPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    companion object {
        lateinit var context: Context
        lateinit var activity: Activity
    }

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.github.hugochou.amap_search")
//        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext

        // 搜索 channel
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.github.hugochou.amap_search");
        channel.setMethodCallHandler { call, result ->
            SEARCH_METHOD_HANDLER[call.method]
                ?.onMethodCall(call, result) ?: result.notImplemented()
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }
}
