//
//  AppDelegate.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import UIKit
import AdCashFramework
import AppTrackingTransparency
import AdSupport
#if canImport(GFPSDK)
import GFPSDK
#endif
#if canImport(BuzzvilSDK)
import BuzzvilSDK
#endif
#if canImport(AppLovinSDK)
import AppLovinSDK
#endif
#if canImport(PAGAdSDK)
import PAGAdSDK
#endif
#if canImport(VungleAdsSDK)
import VungleAdsSDK
#endif
#if canImport(MTGSDK)
import MTGSDK
#endif
#if canImport(GoogleMobileAds)
import GoogleMobileAds
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: AdCash 초기화
        /// 현재 appID와 appSecretKey는 테스트용입니다. 라이브시에는 **반드시** 새로 발급받아야 합니다.
        let appId: String = "9ef18ac03f7c4b45b3f742a4640e8f0d"
        let appSecretKey: String = "aa72314c4b554064"
        
        AdCashInit.setting(appId: appId, appSecretKey: appSecretKey, logLevel: .debug)
        
        /// iOS14이상에서는 광고추적동의 팝업 노출이 필요합니다.
        AdCashInit.trackSetting()
        
        #if canImport(GFPSDK)
        GFPAdManager.setup(withPublisherCd: "7976096509", target: self) { error in
            if let error = error {
                print("gfp ad mananger erro \(error)")
            } else {
                print("gfp ad Mananger none")
            }
        }
        #endif

        #if canImport(AppLovinSDK)
        ALSdk.shared()?.mediationProvider = "max"
        ALSdk.shared()?.userIdentifier = "123"
        ALSdk.initializeSdk()
        #endif

        #if canImport(PAGAdSDK)
        let config = PAGConfig.share()
        config.appID = "8108172"
        PAGSdk.start(with: config) { pSuccess, error in
            if pSuccess {
                print("PAG Success")
            }
        }
        #endif

        #if canImport(VungleAdsSDK)
        VungleAds.initWithAppId("63db2422c08b2ab6cfe8cd58") { error in
            if let error = error {
                print("vungle error")
            }else {
                print("vungle init success")
            }
        }

        if VungleAds.isInitialized(){
            print("Vungle SDK is initialized")
        }else{
            print("Vungle SDK is Not initialized")
        }
        #endif
            
        #if canImport(MTGSDK)
        //        MTGSDK.sharedInstance().setAppID("292050", apiKey: "2f23f5c5f0cc24455e0b5a73067c96ff")
        #endif

        #if canImport(GoogleMobileAds)
        GADMobileAds.sharedInstance().start { result in
            print("googleAdManager initalize \(result)")
        }

        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["00beb564b8cd75ddf87d3f8cf852cd0c"]
        #endif

        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

#if canImport(GFPSDK)
extension AppDelegate: GFPAdManagerDelegate{
    //GFPAdManagerDelegate
    func attStatus() -> GFPATTAuthorizationStatus {
        if #available(iOS 14.5, *) {
          func convertATTrackingStatus(_ status: ATTrackingManager.AuthorizationStatus) -> GFPATTAuthorizationStatus {
            switch status {
            case .authorized:
              return .authorized
            case .denied:
              return .denied
            case .notDetermined:
              return .notDetermined
            case .restricted:
              return .restricted
            @unknown default:
              return .restricted
            }
          }
          return convertATTrackingStatus(ATTrackingManager.trackingAuthorizationStatus)
        } else {
          if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return .authorized
          }
          return .notDetermined
        }
      }
}
#endif

