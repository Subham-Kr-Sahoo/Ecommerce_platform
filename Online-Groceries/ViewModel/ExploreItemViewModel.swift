//
//  ExploreItemViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import Foundation

class ExploreItemViewModel : ObservableObject {
    @Published var eiObj : ExploreModel = ExploreModel(dict:[:])
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr: [ProductModel] = []
    
    init(catObj:ExploreModel){
        self.eiObj = catObj
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter:["cat_id":self.eiObj.id], path: Globs.SV_EXPLORE_ITEMS_LIST,isToken:true){ responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        }failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
}
