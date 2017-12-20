//
//    RootClass.swift
//
//    Create by Matteo Polito on 7/10/2017
//    Copyright © 2017. All rights reserved.

import Foundation
import ObjectMapper


class ProvidersResponse : Mappable{
    
    var extraInfo : [ExtraInfo]?
    var identityProviders : [IdentityProvider]?
    
    init(){
        
    }
    class func newInstance(map: Map) -> Mappable?{
        return ProvidersResponse()
    }
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        extraInfo           <- map["extraInfo"]
        identityProviders   <- map["identityProviders"]
        
    }
}

class IdentityProvider : Mappable{
    
    var entityId : String?
    var identifier : String?
    var name : String?
    
    init(){
        
    }
    class func newInstance(map: Map) -> Mappable?{
        return IdentityProvider()
    }
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        entityId        <- map["entityId"]
        identifier      <- map["identifier"]
        name            <- map["name"]
        
    }
    
}

class ExtraInfo : Mappable{
    
    var title : String?
    var url : String?
    
    init(){
        
    }
    
    class func newInstance(map: Map) -> Mappable?{
        return ExtraInfo()
    }
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        title   <- map["title"]
        url     <- map["url"]
        
    }
}

