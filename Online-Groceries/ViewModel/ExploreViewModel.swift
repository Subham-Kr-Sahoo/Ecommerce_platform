//
//  ExploreViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import Foundation
import SwiftUI

class ExploreViewModel : ObservableObject {
    static var shared : ExploreViewModel = ExploreViewModel()
    @Published var txtSearch: String = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr: [ExploreModel] = []
    
    init() {
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_EXPLORE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ExploreModel(dict: obj as? NSDictionary ?? [:])
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
}
