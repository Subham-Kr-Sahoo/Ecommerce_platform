//
//  ImageModel.swift
//  Online-Groceries
//
//  Created by Subham  on 30/07/24.
//

import Foundation

struct ImageModel : Identifiable,Equatable{
    var id: Int = 0
    var prod_id : Int = 0
    var image : String = ""
    
    init(dict : NSDictionary) {
        self.id = dict.value(forKey: "img_id") as? Int ?? 0
        self.prod_id = dict.value(forKey: "prod_id") as? Int ?? 0
        self.image = dict.value(forKey: "image") as? String ?? ""
    }
    
    static func == (lhs:ImageModel , rhs:ImageModel) -> Bool {
        return lhs.id == rhs.id
    }
}
