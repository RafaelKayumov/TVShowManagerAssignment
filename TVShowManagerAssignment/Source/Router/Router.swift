//
//  Router.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol Router: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool) -> UIViewController?

    func displayAlert(title: String?, message: String?)
    func displayError(error: Error)
}

extension Router {
    func displayProgress() {
        SVProgressHUD.show()
    }

    func dismissProgress() {
        SVProgressHUD.dismiss()
    }

    func displaySuccess() {
        SVProgressHUD.showSuccess(withStatus: "Created")
    }
}

extension UINavigationController: Router {}
