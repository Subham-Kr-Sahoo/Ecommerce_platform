//
//  Globs.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI

struct Globs {
    static let AppName = "Online Grocery"
    static let userPayload = "User_Payload"
    static let userLogin = "User_Login"
    
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    static let SV_LOGIN = BASE_URL + "login"
    
    static let SV_SIGNUP = BASE_URL + "sign_up"

}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSET(data:Any,key:String){
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func UDValue(key:String)-> Any {
        return UserDefaults.standard.value(forKey: key) as Any
    }
    class func UDValueBool(key:String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    class func UDValueTrueBool(key:String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    class func UDRemove(key:String){
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
