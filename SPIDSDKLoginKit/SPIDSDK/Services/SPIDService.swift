//
//  SPIDService.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SPIDService {
    
    var baseUrl: String
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getIdentityProviders(completionHandler: @escaping (DataResponse<ProvidersResponse>) -> Void, errorHandler: @escaping () -> Void) {
        
        let URL = "/59d8e6020f00006d122a2483" //String(format:"%@%@", baseUrl, ServicesUrlConstants.ELENCO_PROVIDERS_PATH)
        Alamofire.request(URL)
            .responseObject { (response: DataResponse<ProvidersResponse>) in
                switch response.result {
                case .success:
                    completionHandler(response);
                    break;
                case .failure:
                    errorHandler();
                    break;
                }
        }
    }
    
    func getAuthenticationSpid(entityId: String, completionHandler: @escaping (DataResponse<AuthSpeedResponse>) -> Void, errorHandler: @escaping () -> Void) {
        let URL = "/59d95ff0100000a606caf130"//String(format:"%@%@?entityId=%@", baseUrl, ServicesUrlConstants.AUTH_SPID_PATH, entityId)
        Alamofire
            .request(URL)
            .responseObject { (response: DataResponse<AuthSpeedResponse>) in
                switch response.result {
                    case .success:
                        completionHandler(response);
                        break;
                    case .failure:
                        errorHandler();
                    break;
                }
            }
    }
}
