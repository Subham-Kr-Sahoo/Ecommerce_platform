//
//  TypeModel.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import Foundation
import SwiftUI

struct TypeModel : Identifiable , Equatable {
    var id: Int = 0
    var type_name : String = ""
    var image : String = ""
    var color : Color = Color.primaryApp
    
    init(dict:NSDictionary){
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.type_name = dict.value(forKey: "type_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex:dict.value(forKey: "color") as? String ?? "000000")
    }
    
    static func == (lhs:TypeModel, rhs:TypeModel) -> Bool {
        return lhs.id == rhs.id
    }
}

