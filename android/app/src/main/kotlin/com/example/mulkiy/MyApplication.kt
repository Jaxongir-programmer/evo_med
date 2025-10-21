package com.example.evo_med

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("uz_UZ");
        MapKitFactory.setApiKey("5b9bdcdb-ba51-45cd-9851-902bcead92e0");
    }
}