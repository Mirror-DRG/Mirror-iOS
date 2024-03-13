//
//  AppDelegate.swift
//  Mirror_ios
//
//  Created by 경유진 on 3/4/24.
//

import UIKit
import AVFAudio


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: - 기본 네비게이션 바 커스텀
        let appearance = UINavigationBar.appearance()
        
        // 배경색을 화이트로 설정
        appearance.backgroundColor = UIColor.customWhite
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customBlack,
                                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        
        // MARK: - 무음 시에도 소리 재생
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch let error as NSError {
            print("Error : \(error), \(error.userInfo)")
        }
                
        do {
             try AVAudioSession.sharedInstance().setActive(true)
        }
          catch let error as NSError {
            print("Error: Could not setActive to true: \(error), \(error.userInfo)")
        }
        
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

