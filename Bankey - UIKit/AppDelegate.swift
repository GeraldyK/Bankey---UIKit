//
//  AppDelegate.swift
//  Bankey - UIKit
//
//  Created by Geraldy Kumara on 31/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnBoardingViewController(heroImageName: "delorean", text: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s")
//        
        return true
    }
    
}

