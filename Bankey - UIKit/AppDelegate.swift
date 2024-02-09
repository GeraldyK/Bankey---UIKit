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
   // private var hasOnBoard = false
    
    let loginViewController = LoginViewController()
    let onBoardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onBoardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
        //window?.rootViewController = onBoardingContainerViewController
        
        window?.rootViewController = loginViewController
//        window?.rootViewController = OnBoardingViewController(heroImageName: "delorean", text: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s")
//        
        return true
    }
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}


extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        LocalState.hasOnBoarded ? setRootViewController(dummyViewController) : setRootViewController(onBoardingContainerViewController)
    }
}

extension AppDelegate: OnBoardingContainerViewControllerDelegate{
    func didFinishOnBoarding() {
        LocalState.hasOnBoarded = true
        setRootViewController(dummyViewController)
    }
}

extension AppDelegate: LogoutDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
