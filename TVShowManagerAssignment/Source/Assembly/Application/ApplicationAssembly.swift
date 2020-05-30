//
//  ApplicationAssembly.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class ApplicationAssembly {

    private(set) var window: UIWindow?
    private(set) var rootNavigationController = UINavigationController()

    func setupUIStack() {
        let window = UIWindow()
        window.backgroundColor = UIColor.white
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()

        self.window = window
    }
}
