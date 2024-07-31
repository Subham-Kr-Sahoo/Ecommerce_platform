//
//  NutritionModel.swift
//  Online-Groceries
//
//  Created by Subham  on 30/07/24.
//

import SwiftUI

struct NutritionModel : Identifiable , Equatable {
    var id: Int = 0
    var nutrition_name : String = ""
    var nutritionValue : String = ""
    
    init(dict : NSDictionary) {
        self.id = dict.value(forKey: "nutrition_id") as? Int ?? 0
        self.nutrition_name = dict.value(forKey: "nutrition_name") as? String ?? ""
        self.nutritionValue = dict.value(forKey: "nutrition_value") as? String ?? ""
    }
    
    static func == (lhs:NutritionModel , rhs:NutritionModel) -> Bool {
        return lhs.id == rhs.id
    }
}
