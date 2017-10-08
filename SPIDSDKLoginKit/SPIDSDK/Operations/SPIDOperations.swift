//
//  SPIDOperations.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import AlamofireObjectMapper
import Alamofire
import XLActionController
import SafariServices
import WebKit
import SwiftWebVC

class SPIDOperation : NSObject, SwiftWebVCDelegate  {
    
    fileprivate var baseUrl: String
    fileprivate var baseVC: UIViewController?
    
    fileprivate var spidService: SPIDService
    fileprivate var webVC: SwiftModalWebVC!
    
    init(baseUrl: String, baseVC: UIViewController?) {
        self.baseUrl = baseUrl
        self.baseVC = baseVC
        
        self.spidService = SPIDService(baseUrl: baseUrl);
    }
    
    public func doElencoProviders() {
        
        Loading.showLoading()
        
        spidService.getIdentityProviders (completionHandler: { (response: DataResponse<ProvidersResponse>) in
            
            Loading.hideLoading()
            
            if let providers = response.result.value {
                self.doShowActions(providers: providers);
            }
            
        }, errorHandler: {
            Loading.hideLoading()
            self.baseVC?.alert(message: L10n.attenzioneServiceBody, title: "", okHandler: {})
        })
    }
    
    public func doGetAuthenticationSpid(entityId: String) {
        Loading.showLoading()
        
        spidService.getAuthenticationSpid(entityId: entityId, completionHandler: { (response: DataResponse<AuthSpeedResponse>) in
            
            Loading.hideLoading()
            
            if let authInfo = response.result.value {
                if let url = authInfo.destinationUrl {
                    self.openBrowser(url: url)
                }
            }
        }, errorHandler: {
            Loading.hideLoading()
            self.baseVC?.alert(message: L10n.attenzioneServiceBody, okHandler: {})
        })
    }
    public func doGetDettaglioUtente() {
        Loading.showLoading()
        
        spidService.getUserSpid(completionHandler: { (response: DataResponse<SPIDUserResponse>) in
            
            Loading.hideLoading()
            
            let res = String(format: "%@ %@", L10n.loginOkBody,response.result.value?.toJSON() ?? "");
            
            self.webVC?.alert(message: res, title: L10n.loginOkTitle, okHandler: {
                self.webVC.dismiss(animated: true, completion: nil)
            })
            
        }, errorHandler: {
            Loading.hideLoading()
            self.baseVC?.alert(message: L10n.attenzioneServiceBody, okHandler: {})
        })
    }
    
    fileprivate func doShowActions(providers: ProvidersResponse){
        let actionController = SPIDActionController()
        
        if let prov = providers.identityProviders {
            
            for provider in prov {
                
                actionController.addAction(Action(ActionData(title: provider.name ?? "", image: ProviderImageDecoder.decodeImage(providerIdentifier: provider.identifier ?? "")), style: .default, handler: { action in
                    
                    if let entityId = provider.entityId{
                        self.doGetAuthenticationSpid(entityId: entityId);
                    }
                    
                }))
            }
        }
        
        if let extras = providers.extraInfo {
            
            for extra in extras {
                
                actionController.addAction(Action(ActionData(title: extra.title ?? "", image: Asset.SpidLogos.info.image), style: .default, handler: { action in
                    
                    if let url = extra.url {
                        self.openBrowser(url: url)
                    }
                    
                }))
                
            }
        }
        
        actionController.addAction(Action(ActionData(title: L10n.annullaTitle, image: Asset.SpidLogos.cancel.image), style: .default, handler: { action in
            
            actionController.dismiss()
            
        }))
            
        self.baseVC?.present(actionController, animated: true, completion: nil)
    }

    //MARK: Esegue l'apertura del browser per la visualizzazione dei vari link
    fileprivate func openBrowser(url: String, body: String? = nil) {
        self.webVC = SwiftModalWebVC(urlString: url, webViewDelegate: self)
        self.baseVC?.present(webVC, animated: true, completion: nil)
    }
    //MARK:SwiftWebVCDelegate
    func didStartLoading() {
    }
    func didFinishLoading(url: String?, body: String?, success: Bool) {
        if url == SPIDConstants.POSTE_OK_URL {
            
            doGetDettaglioUtente();
            
        }
    }
    
}
