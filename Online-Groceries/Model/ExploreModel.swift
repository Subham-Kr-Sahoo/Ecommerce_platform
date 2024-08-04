//
//  ExploreModel.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import Foundation
import SwiftUI

struct ExploreModel : Identifiable,Equatable {
    var id: Int = 0
    var name : String = ""
    var image : String = ""
    var color : Color = Color.primaryApp
    
    init(dict:NSDictionary){
        self.id = dict.value(forKey: "cat_id") as? Int ?? 0
        self.name = dict.value(forKey: "cat_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex:dict.value(forKey: "color") as? String ?? "000000")
    }
    
    static func == (lhs:ExploreModel,rhs:ExploreModel) -> Bool {
        return lhs.id == rhs.id
    }
}


