//
//  PromoCodeModel.swift
//  Online-Groceries
//
//  Created by Subham  on 05/08/24.
//

import Foundation

struct PromoCodeModel : Identifiable,Equatable {
    var id : Int = 0
    var code : String = ""
    var title : String = ""
    var description : String = ""
    var type : Int = 0
    var min_order_amount : Int = 0
    var max_discount_amount : Int = 0
    var offer_price : Int = 0
    var start_date : Date = Date()
    var end_date : Date = Date()
    
    init(dict:NSDictionary){
        self.id = dict.value(forKey: "promo_code_id") as? Int ?? 0
        self.code = dict.value(forKey: "code") as? String ?? ""
        self.title = dict.value(forKey: "title") as? String ?? ""
        self.description = dict.value(forKey: "description") as? String ?? ""
        self.type = dict.value(forKey: "type") as? Int ?? 0
        self.min_order_amount = dict.value(forKey: "min_order_amount") as? Int ?? 0
        self.max_discount_amount = dict.value(forKey: "max_discount_amount") as? Int ?? 0
        self.offer_price = dict.value(forKey: "offer_price") as? Int ?? 0
        self.start_date = (dict.value(forKey: "start_date") as? String ?? "").stringDatetodate() ?? Date()
        self.end_date = (dict.value(forKey: "end_date") as? String ?? "").stringDatetodate() ?? Date()
    }
    static func == (lhs:PromoCodeModel , rhs:PromoCodeModel) -> Bool {
        return lhs.id == rhs.id
    }
}

