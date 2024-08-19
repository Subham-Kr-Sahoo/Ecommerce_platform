//
//  PaymentViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 10/08/24.
//

import Foundation

class PaymentViewModel: ObservableObject
{
    static var shared: PaymentViewModel = PaymentViewModel()
    
    
    @Published var txtName: String = ""
    @Published var txtCardNumber: String = ""
    @Published var txtCardMonth: String = ""
    @Published var txtCardYear: String = ""
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [PaymentModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    func clearAll(){
        txtName = ""
        txtCardNumber = ""
        txtCardYear = ""
        txtCardMonth = ""
        
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_PAYMENT_METHOD_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return PaymentModel(dict: obj as? NSDictionary ?? [:])
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
    
    func serviceCallRemove(pObj: PaymentModel){
        ServiceCall.post(parameter: ["pay_id": pObj.id], path: Globs.SV_REMOVE_PAYMENT_METHOD, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.serviceCallList()
                    
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
    
    func serviceCallAdd(didDone: ((  )->())? ) {
        
        if(txtName.isEmpty) {
            errorMessage = "please enter name"
            showError = true
            return
        }
        
        if(txtCardNumber.count != 16) {
            errorMessage = "please enter valid card number"
            showError = true
            return
        }
        
        
        if(txtCardMonth.count != 2) {
            errorMessage = "please enter valid card month"
            showError = true
            return
        }
        
        if(txtCardYear.count != 4) {
            errorMessage = "please enter valid card year"
            showError = true
            return
        }
        
        if isValidCardYear(cardYear: txtCardYear, cardMonth: txtCardMonth){
            ServiceCall.post(parameter: ["name":txtName, "card_number":txtCardNumber, "card_month":txtCardMonth, "card_year": txtCardYear], path: Globs.SV_ADD_PAYMENT_METHOD, isToken: true ) { responseObj in
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
        }else{
            errorMessage = "Your Card is already Expired"
            showError = true
        }
    }
    
    func isValidCardYear(cardYear :String,cardMonth :String)->Bool{
        let year = Int(cardYear) ?? 0
        let currentYear = Calendar.current.component(.year, from: Date())
        let month = Int(cardMonth) ?? 0
        let currentMonth = Calendar.current.component(.month, from: Date())
        print(month)
        print(currentMonth)
        var boolean = true
        if year < currentYear {
            boolean = false
            return boolean
        }
        if year == currentYear {
            if month < currentMonth {
                boolean = false
                return boolean
            }
            else{
                return boolean
            }
        }
        return boolean
    }
}
