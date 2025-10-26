package com.example.medical_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Install splash screen before calling super
        installSplashScreen()
        super.onCreate(savedInstanceState)
    }
}