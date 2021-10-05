//
//  AppDelegate.swift
//  MVP_ToDoList
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UserDefaults.standard.register(defaults: ["TodoItems" : ["Item1",
                                                                 "Item2",
                                                                 "Item3",
                                                                 "Item4"]])
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        let model = TestModel()
        let presenter = TestPresenter(view: view, model: model)
        
        view.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        return true
    }
}

