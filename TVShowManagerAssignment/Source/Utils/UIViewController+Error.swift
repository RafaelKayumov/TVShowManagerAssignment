//
//  UIViewController+Error.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

extension UIViewController {

    func displayError(error: Error) {
        displayAlert(title: "Error", message: error.localizedDescription)
    }

    func displayAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let dismissActoin = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(dismissActoin)
        self.present(alertController, animated: true, completion: nil)
    }
}
