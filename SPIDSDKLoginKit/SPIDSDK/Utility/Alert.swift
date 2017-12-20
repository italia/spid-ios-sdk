//
//  Alert.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(message: String, title: String = "", okHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: L10n.alertOkTitle, style: .default, handler: { (alert: UIAlertAction!) in
            okHandler()
        })
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
