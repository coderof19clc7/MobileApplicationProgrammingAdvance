package com.example.one_one_learn

import io.flutter.embedding.android.FlutterActivity
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull
import com.thorito.jitsi_meet.JitsiMeetPluginActivity
// import dev.saibotma.jitsi_meet_wrapper.JitsiMeetWrapperActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private val CHANNEL = "pip/fullscreen"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "fullscreen"){
                var intent = Intent(context, JitsiMeetPluginActivity::class.java)
                // var intent = Intent(context, JitsiMeetWrapperActivity::class.java)
                intent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
                context?.startActivity(intent)
            }
        }
    }
}
