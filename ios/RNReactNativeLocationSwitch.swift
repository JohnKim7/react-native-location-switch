
//
//  NotificationPermission.swift
//  RNCheckNotificationPermission
//
//  Created by Nam Duong on 6/24/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

@objc(RNReactNativeLocationSwitch)
class RNReactNativeLocationSwitch: NSObject {
    
    @objc
    func isLocationEnabled(_ resolve: @escaping RCTPromiseResolveBlock,
                                     rejecter reject: @escaping RCTPromiseRejectBlock) {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
               resolve(false)
            case .authorizedAlways, .authorizedWhenInUse:
                resolve(true)
            }
        } else {
           resolve(false)
        }
    }
    
    @objc
    func changeLocationSetting() {
        if #available(iOS 10.0, *) {
            if !CLLocationManager.locationServicesEnabled() {
                if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                    // If general location settings are disabled then open general location settings
                    UIApplication.shared.openURL(url)
                }
            } else {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    // If general location settings are enabled then open location settings for the app
                    UIApplication.shared.openURL(url)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
