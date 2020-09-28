//
//  PerfectWeiBoApp.swift
//  PerfectWeiBo
//
//  Created by Joe on 2020/9/26.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport

import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var appOpenAd: GADAppOpenAd?
    
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
        GADAppOpenAd.load(withAdUnitID: "ca-app-pub-3940256099942544/1033173712", request: GADRequest(), orientation: .portrait) { (openAd, err) in
            if (err != nil) {
                return;
            }
            appDelegate.appOpenAd = openAd;
            let rootVC = window.rootViewController
            openAd?.present(fromRootViewController: rootVC!)
        }
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


extension AppDelegate{
    
    
}
