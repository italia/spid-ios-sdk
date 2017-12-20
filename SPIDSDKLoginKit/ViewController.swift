//
//  ViewController.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController, UISPIDButtonDelegate {
    
    @IBOutlet weak var responseView: UIView!
    @IBOutlet weak var responseTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        responseView.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Implementation UISPIDButtonDelegate
    func didReceivedResponse(userResponse: NSObject?){
        if var user = userResponse as? SPIDUserResponse {
            responseView.isHidden = false;
            responseTextView.text = user.toJSONString(prettyPrint: true)
        }
    }
}

