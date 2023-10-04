//
//  AppDelegate.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import UIKit

import AvatyeAdCash

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: AdCash 초기화
        /// 현재 appID와 appSecretKey는 테스트용입니다. 라이브시에는 **반드시** 새로 발급받아야 합니다.
        AdCashInit(appId: "0ff121d0b7b24d04b27b0efa9d162656", appSecretKey: "9f30be8f57b34e44")
        /// iOS14이상에서는 광고추적동의 팝업 노출이 필요합니다.
        AdCashInit.trackSetting()
        
        
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

