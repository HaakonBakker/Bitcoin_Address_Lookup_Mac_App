//
//  Lookup.swift
//  BitcoinAddressLookup
//
//  Created by Haakon W Hoel Bakker on 17/12/2017.
//  Copyright © 2017 Bakker Technologies. All rights reserved.
//

import Foundation

class Lookup {
    
    init() {
        
    }
    
    func satoshiToBTC(sat:Int) -> Double{
        // 100000000
        let satInOneBTC = 100000000.0
        let btc = Double(sat)/satInOneBTC
        return btc
    }
    
    
    func performRequest(address:String, completion: @escaping ([String:Any]) -> ()) -> Void {
        let apiCall = self.createAPICall(address: address)
        
        let parser = Parser()
        
        parser.networkRequest(APICall: apiCall, completion: { (success) -> Void in
            //print(success)
            completion(success)
        })
        
        
    }
    
    func createAPICall(address:String) -> String {
        // Header aka. alt før det viktige
        let BASEURL = "https://api.blockcypher.com/v1/btc/main/addrs/"
        
        
        let APICall = BASEURL + address
    
        return APICall
    }
}
