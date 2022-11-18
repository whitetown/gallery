//
//  AppDelegate.swift
//  gallery
//
//  Created by Sergey Chehuta on 18/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootNC: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.rootNC = BaseNavigationController(rootViewController: PhotosViewController())
        self.window?.rootViewController = self.rootNC
        self.window?.makeKeyAndVisible()

        return true
    }

}

