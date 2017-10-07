//
//  ProvidersImageDecoder.swift
//  SPIDSDKLoginKit
//
//  Created by Matteo Polito on 10/7/17.
//  Copyright © 2017 Matteo Polito. All rights reserved.
//

import Foundation
import UIKit

class ProviderImageDecoder {
    
    static func decodeImage(providerIdentifier: String) -> UIImage{
        switch providerIdentifier {
        case "posteid":
            return Asset.IdpLogos.spidIdpPosteid.image
        case "timid":
            return Asset.IdpLogos.spidIdpTimid.image
        case "namirialid":
            return Asset.IdpLogos.spidIdpNamirialid.image
        case "infocertid":
            return Asset.IdpLogos.spidIdpInfocertid.image
        case "sielteid":
            return Asset.IdpLogos.spidIdpSielteid.image
        case "spiditalia":
            return Asset.IdpLogos.spidIdpSpiditalia.image
        case "arubaid":
            return Asset.IdpLogos.spidIdpArubaid.image
            
        default:
            return Asset.IdpLogos.spidIdpArubaid.image
        }
    }
    
    
}
