//
//  SPIDFinalResponse.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/8/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import ObjectMapper


class SPIDUserResponse : NSObject, Mappable {
    
    var codiceFiscale : String?
    var codiceIdentificativo : String?
    var cognome : String?
    var dataNascita : String?
    var dataScadenzaIdentita : String?
    var documentoIdentita : String?
    var emailAddress : String?
    var emailPec : String?
    var indirizzoDomicilio : String?
    var indirizzoSedeLegale : String?
    var luogoNascita : String?
    var nome : String?
    var numeroTelefono : String?
    var partitaIva : String?
    var provinciaNascita : String?
    var ragioneSociale : String?
    var sesso : String?
    
    override init() {
        
    }
    
    class func newInstance(map: Map) -> Mappable?{
        return SPIDUserResponse()
    }
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        codiceFiscale           <- map["codiceFiscale"]
        codiceIdentificativo    <- map["codiceIdentificativo"]
        cognome                 <- map["cognome"]
        dataNascita             <- map["dataNascita"]
        dataScadenzaIdentita    <- map["dataScadenzaIdentita"]
        documentoIdentita       <- map["documentoIdentita"]
        emailAddress            <- map["emailAddress"]
        emailPec                <- map["emailPec"]
        indirizzoDomicilio      <- map["indirizzoDomicilio"]
        indirizzoSedeLegale     <- map["indirizzoSedeLegale"]
        luogoNascita            <- map["luogoNascita"]
        nome                    <- map["nome"]
        numeroTelefono          <- map["numeroTelefono"]
        partitaIva              <- map["partitaIva"]
        provinciaNascita        <- map["provinciaNascita"]
        ragioneSociale          <- map["ragioneSociale"]
        sesso                   <- map["sesso"]
        
    }
}
