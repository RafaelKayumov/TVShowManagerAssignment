//
//  AppDelegate.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private(set) var rootNavigationController: UINavigationController?
    private let applicationAssembly = ApplicationAssembly()
    private var modulesAssembly: ModulesAssemblyProtocol!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootNavigationController = applicationAssembly.rootNavigationController
        modulesAssembly = ModulesAssembly(router: rootNavigationController)

        let optionSelectModule = modulesAssembly.optionSelectModule()
        rootNavigationController.viewControllers = [optionSelectModule]

        applicationAssembly.setupUIStack()

        return true
    }
}
