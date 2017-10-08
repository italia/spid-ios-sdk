//
//  SPIDButton.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//
import Foundation
import UIKit
import ObjectMapper

@objc
protocol UISPIDButtonDelegate {
    @objc
    optional func didReceivedResponse(userResponse: NSObject?)
}

class UISPIDButton: UIButton {
    
    @IBOutlet
    var masterVC: UIViewController?
    
    @IBInspectable
    var baseUrl: String?
    
    // MARK: - UIButton
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        updateBackgrounfImage()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        updateBackgrounfImage()
    }
    
    fileprivate func configure() {
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
        addTarget(self, action: #selector(UISPIDButton.buttonClicked(sender:)), for: .touchUpInside)
    }
    fileprivate func updateBackgrounfImage() {
        self.setBackgroundImage(Asset.SpidLogos.spidButtonLinkHover.image, for: UIControlState.normal);
    }
    @objc
    fileprivate func buttonClicked(sender: UIButton) {
        if let baseUrl = baseUrl {
            let spidOperation = SPIDOperation(baseUrl: baseUrl, baseVC: masterVC)
            spidOperation.doElencoProviders();            
        }
    }
}

