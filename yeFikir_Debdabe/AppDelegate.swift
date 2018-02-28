//
//  AppDelegate.swift
//  yeFikir_Debdabe
//
//  Created by user on 5/30/17.
//  Copyright © 2017 AFC Ethiopia. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate,MessagingDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GADMobileAds.configure(withApplicationID:"ca-app-pub-9156727777369518~1581272034")
        application.registerForRemoteNotifications()
        
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in} )
        }
            
        else {
            
            let setting: UIUserNotificationSettings = UIUserNotificationSettings(
                types: [.alert, .badge, .sound],categories:nil)
            application.registerUserNotificationSettings(setting)
        }
        
        Messaging.messaging().delegate = self
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        
        
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String){
    
    print("Firebase registration token:\(fcmToken)")
    
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        if (DetailOne.player?.isPlaying)! {
            
            DetailOne.player?.stop()
            
        }

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        if (DetailOne.player?.isPlaying)! {
            
            DetailOne.player?.stop()
            
        }

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
        DetailOne.player?.play()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        
    }
    

}

