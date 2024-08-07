//
//  UserNameViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import Foundation

class UserNameViewModel : ObservableObject {
    static var shared : UserNameViewModel = UserNameViewModel()
    @Published var showError = false
    @Published var errorMessage : String = ""
    @Published var Name : String = ""
    @Published var Email : String = ""
    
    init(){
        serviceCallName()
    }
    
    func serviceCallName(){
        ServiceCall.post(parameter:[:], path: Globs.SV_NAME_AND_EMAIL,isToken:true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String == "1" {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.Name = payloadObj.value(forKey: "username") as? String ?? ""
                        self.Email = payloadObj.value(forKey: "email") as? String ?? ""
                    }
                }
                else{
                    self.errorMessage = response.value(forKey:KKey.message) as? String ?? "Failure"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }

    }
}
