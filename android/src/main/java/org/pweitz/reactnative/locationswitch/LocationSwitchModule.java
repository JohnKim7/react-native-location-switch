package org.pweitz.reactnative.locationswitch;

import android.content.Context;
import android.content.Intent;
import android.location.LocationManager;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class LocationSwitchModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public LocationSwitchModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNReactNativeLocationSwitch";
    }

    @ReactMethod
    public void isLocationEnabled(Promise promise) {

        try {
            LocationManager lm = (LocationManager) getCurrentActivity().getSystemService(Context.LOCATION_SERVICE);
            boolean gpsEnabled = lm.isProviderEnabled(LocationManager.GPS_PROVIDER);
            boolean networkEnabled = lm.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
            promise.resolve(gpsEnabled || networkEnabled);
        } catch (Exception ex) {
            promise.resolve(false);
        }
    }

    @ReactMethod
    public void changeLocationSetting() {
        Intent intent = new Intent("android.settings.ACTION_LOCATION_SOURCE_SETTINGS"); // Settings.ACTION_LOCATION_SOURCE_SETTINGS
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);

        if (intent.resolveActivity(reactContext.getPackageManager()) != null) {
            reactContext.startActivity(intent);
        }
    }
}
