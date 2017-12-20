//
//  AuthSpidResponse.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthSpeedResponse : Mappable{
    
    var destinationUrl : String?
    var xmlAuthRequest : String?
    
    class func newInstance(map: Map) -> Mappable?{
        return AuthSpeedResponse()
    }
    
    init() {
        
    }
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        destinationUrl <- map["destinationUrl"]
        xmlAuthRequest <- map["xmlAuthRequest"]
    }
    
}
