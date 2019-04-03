//
//  AppDelegate.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let stackApiService = StackApiService()
        let viewModel = ListViewModel(items: [], stackApiService: stackApiService)
        let rootVC = ListVC.createWith(title: "Stack Overflow Users", viewModel: viewModel)
        let rootNav = UINavigationController(rootViewController: rootVC)
        rootNav.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
                
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

