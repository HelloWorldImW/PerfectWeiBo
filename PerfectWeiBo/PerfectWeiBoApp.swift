//
//  PerfectWeiBoApp.swift
//  PerfectWeiBo
//
//  Created by Joe on 2020/9/26.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport
import BUAdSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

@main
struct PerfectWeiBoApp: App {
    let persistenceController = PersistenceController.preview

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).onAppear(perform: configAD)
        }
    }
    
    func configAD() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        requestIDFA()
        BUAdSDKManager.setAppID("5108684")
        BUAdSDKManager.setIsPaidApp(false)
        BUAdSDKManager.setLoglevel(.debug)
        let frame = UIScreen.main.bounds
        let adView:BUSplashAdView = BUSplashAdView(slotID: "887385710", frame: frame)
        adView.delegate = appDelegate
        adView.loadAdData()
        window.rootViewController?.view.addSubview(adView)
        adView.rootViewController = window.rootViewController
    }
    
}

// MARK: Private Methods
private func requestIDFA() {
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
    switch status {
    case .notDetermined:
        print("未确定")
    case .restricted:
        print("受限制的")
    case .denied:
        print("拒绝")
    case .authorized:
        print("授权")
    @unknown default:
        #if DEBUG
        assert(true, "权限错误")
        #endif
        print("Error! 未知权限选项")
    }}
  )
}


extension AppDelegate: BUSplashAdDelegate{
    func splashAdDidLoad(_ splashAd: BUSplashAdView) {
        print("")
    }
    
    func splashAdDidClose(_ splashAd: BUSplashAdView) {
        splashAd.removeFromSuperview()
        print("")
    }
    
}
