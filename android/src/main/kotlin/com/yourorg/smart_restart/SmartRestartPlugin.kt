package com.yourorg.smart_restart

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/** SmartRestartPlugin
 *
 * Clean relaunch: launches the app's main intent with a cleared task,
 * finishes the current task, and returns. No host app changes required.
 */
class SmartRestartPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "smart_restart")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "restartClean" -> {
                val act = activity
                if (act == null) {
                    result.error("NO_ACTIVITY", "Activity not available", null)
                    return
                }
                act.runOnUiThread {
                    val intent = act.packageManager.getLaunchIntentForPackage(act.packageName)
                    if (intent != null) {
                        intent.addFlags(
                            Intent.FLAG_ACTIVITY_CLEAR_TOP or
                            Intent.FLAG_ACTIVITY_NEW_TASK or
                            Intent.FLAG_ACTIVITY_CLEAR_TASK
                        )
                        act.startActivity(intent)
                        act.finishAffinity()
                        // Optional (rarely needed): hard-exit in debug if you see odd states
                        // android.os.Process.killProcess(android.os.Process.myPid())
                        // Runtime.getRuntime().exit(0)
                    }
                    result.success(null)
                }
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    // ---- ActivityAware ----
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }
    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }
    override fun onDetachedFromActivity() {
        activity = null
    }
}
