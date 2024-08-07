//
//  MainViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI

class MainViewModel : ObservableObject {
    static var shared : MainViewModel = MainViewModel()
    @Published var txtUsername : String = ""
    @Published var txtEmail : String = ""
    @Published var txtPassword : String = ""
    @Published var isShowPassword : Bool = false
    @Published var showError = false
    @Published var errorMessage : String = ""
    @Published var isUserLogin : Bool = false
    @Published var userObj : UserModel = UserModel(dict: [:])
    
    //MARK: service call
    init(){
        if (Utils.UDValueBool(key: Globs.userLogin)){
            self.setUserData(uDict: Utils.UDValue(key: Globs.userPayload) as? NSDictionary ?? [:])
        }else{
            
        }
//        #if DEBUG
//        txtUsername = "user"
//        txtEmail = "something2@gmail.com"
//        txtPassword = "111111"
//        #endif
        
    }
    
    func logout(){
        Utils.UDSET(data:false,key: Globs.userLogin)
        isUserLogin = false
    }
    
    func serviceCallLogin(){
        
        if(!txtEmail.isValidEmail){
            self.errorMessage = "Please enter a valid email address"
            self.showError = true
            return
        }
        if(txtPassword.isEmpty){
            self.errorMessage = "Please enter a valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["email":txtEmail,"password":txtPassword,"device_token":""], path: Globs.SV_LOGIN){ responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Failure"
                    self.showError = true
                }
            }
            
        }failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallSignup(){
        if(txtUsername.isEmpty){
            self.errorMessage = "Please enter valid Username"
            self.showError = true
            return
        }
        if(!txtEmail.isValidEmail){
            self.errorMessage = "Please enter a valid email address"
            self.showError = true
            return
        }
        if(txtPassword.isEmpty){
            self.errorMessage = "Please enter a valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["username":txtUsername,"email":txtEmail,"password":txtPassword,"device_token":""], path: Globs.SV_SIGN_UP){ responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Failure"
                    self.showError = true
                }
            }
            
        }failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    func setUserData(uDict:NSDictionary){
        Utils.UDSET(data: uDict, key: Globs.userPayload)
        Utils.UDSET(data: true, key: Globs.userLogin)
        
        self.userObj = UserModel(dict: uDict)
        self.isUserLogin = true
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
        
    }
}

