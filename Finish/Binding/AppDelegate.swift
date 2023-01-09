//
//  AppDelegate.swift
//  Binding
//
//  Created by Itunu Raimi on 03/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 1
    var window: UIWindow?
    let overlay = UIView()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //2
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // 3
        if let window = window {
            overlay.frame = window.frame
            overlay.backgroundColor = .black.withAlphaComponent(0.95)
            window.addSubview(overlay)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // 4
        overlay.removeFromSuperview()
    }
}

