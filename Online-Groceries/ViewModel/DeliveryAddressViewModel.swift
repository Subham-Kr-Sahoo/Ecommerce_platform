//
//  DeliveryViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import Foundation

class DeliveryAddressViewModel : ObservableObject {
    static var shared : DeliveryAddressViewModel = DeliveryAddressViewModel()
    @Published var showError = false
    @Published var errorMessage : String = ""
    @Published var AddressArray : [AddressModel] = []
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtAddress: String = ""
    @Published var txtCity: String = ""
    @Published var txtState: String = "Select"
    @Published var txtPostalCode: String = ""
    @Published var txtTypeName: String = "Home"
    
    func clearAll(){
        txtName = ""
        txtMobile = ""
        txtAddress = ""
        txtCity = ""
        txtState = "Select"
        txtPostalCode = ""
        txtTypeName = "Home"
    }
    
    func setData(addressObj: AddressModel) {
        txtName = addressObj.name
        txtMobile = addressObj.phone
        txtAddress = addressObj.address
        txtCity = addressObj.city
        txtState = addressObj.state
        txtPostalCode = addressObj.postalCode
        txtTypeName = addressObj.typeName
    }
    
    init(){
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_ADDRESS_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.AddressArray = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return AddressModel(dict: obj as? NSDictionary ?? [:])
                    })
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    func serviceCallRemove(Address:AddressModel){
        ServiceCall.post(parameter: ["address_id":Address.id], path: Globs.SV_REMOVE_ADDRESS,isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.serviceCallList()
                }
                else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    func serviceCallMarkasDefault(Address:AddressModel){
        ServiceCall.post(parameter:["address_id":Address.id], path: Globs.SV_ADDRESS_MARK_AS_DEFAULT,isToken:true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.serviceCallList()
                }
                else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    func serviceCallUpdateAddress( aObj: AddressModel?, didDone: (()->())? ) {
        if(txtName.isEmpty) {
            self.errorMessage = "Please Enter a Name"
            self.showError = true
            return
        }
        
        if(txtMobile.isEmpty) {
            self.errorMessage = "Please Enter a Phone Number so we can call if there any issues with Delivery"
            self.showError = true
            return
        }
        
        if(txtAddress.isEmpty) {
            self.errorMessage = "Please Enter an Address"
            self.showError = true
            return
        }
        
        if(txtCity.isEmpty) {
            self.errorMessage = "Please Enter a City"
            self.showError = true
            return
        }
        
        if(txtState == "Select") {
            self.errorMessage = "Please Enter a State"
            self.showError = true
            return
        }
        
        if(txtPostalCode.isEmpty) {
            self.errorMessage = "Please Enter a 6-digit Pin Code"
            self.showError = true
            return
        }
        ServiceCall.post(parameter: ["address_id": aObj?.id ?? "", "name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode ], path: Globs.SV_UPDATE_ADDRESS, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Failure"
            self.showError = true
        }
    }
    func serviceCallAddAddress(didDone: (()->())? ) {
        if(txtName.isEmpty) {
            self.errorMessage = "Please Enter a Name"
            self.showError = true
            return
        }
        
        if(txtMobile.isEmpty) {
            self.errorMessage = "Please Enter a Phone Number so we can call if there any issues with Delivery"
            self.showError = true
            return
        }
        
        if(txtAddress.isEmpty) {
            self.errorMessage = "Please Enter an Address"
            self.showError = true
            return
        }
        
        if(txtCity.isEmpty) {
            self.errorMessage = "Please Enter a City"
            self.showError = true
            return
        }
        
        if(txtState == "Select") {
            self.errorMessage = "Please Enter a State"
            self.showError = true
            return
        }
        
        if(txtPostalCode.isEmpty) {
            self.errorMessage = "Please Enter a 6-digit Pin Code"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode  ], path: Globs.SV_ADD_ADDRESS, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }

    }
}
