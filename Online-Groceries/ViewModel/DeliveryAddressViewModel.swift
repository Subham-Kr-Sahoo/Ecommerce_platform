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
}
