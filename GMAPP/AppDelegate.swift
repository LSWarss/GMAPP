//
//  AppDelegate.swift
//  GMAPP
//
//  Created by Lukasz Stachnik on 28/03/2021.
//

import Foundation
import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { success, error in
                
                if success {
                    Logger.shared.log("Local notification accepted")
                } else if let error = error {
                    Logger.shared.error(error.localizedDescription)
                }
                
            })
            return true
    }
    
    
}
