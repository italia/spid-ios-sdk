//
//  Loading.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import PKHUD

class Loading {
    
    static func showLoading()  {
        DispatchQueue.main.async {
            HUD.show(HUDContentType.progress)
        }
    }
    
    static func hideLoading() {
        DispatchQueue.main.async {
            HUD.hide()
        }
    }
}
