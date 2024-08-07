//
//  UserNameModel.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import Foundation

struct UserNameModel : Identifiable,Equatable{
    var id : UUID = UUID()
    var name : String = ""
    var email : String = ""
    init(dict:NSDictionary){
        self.name = dict.value(forKey: "username") as? String ?? ""
        self.email = dict.value(forKey: "email") as? String ?? ""
    }
    static func == (lhs: UserNameModel, rhs: UserNameModel) -> Bool{
        return lhs.id == rhs.id
    }
}
