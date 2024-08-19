//
//  NotificationViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 19/08/24.
//

import Foundation

class NotificationViewModel : ObservableObject{
    static let shared : NotificationViewModel = NotificationViewModel()
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr : [NotificationModel] = []
    @Published var nObj: NotificationModel = NotificationModel(dict: [:])
    init(){
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_NOTIFICATION_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return NotificationModel(dict: obj as? NSDictionary ?? [:])
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
    func serviceCallReadAll(){
        ServiceCall.post(parameter: [:], path: Globs.SV_NOTIFICATION_READ_ALL, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.serviceCallList()
                    self.errorMessage = "All your notification are read"
                    self.showError = true
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
    func serviceCallReadOne(){
        ServiceCall.post(parameter:["notification_id":self.nObj.id], path: Globs.SV_NOTIFICATION_READ_ONE, isToken: true ) { responseObj in
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
}
