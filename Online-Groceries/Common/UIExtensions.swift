//
//  UIExtensions.swift
//  Online-Groceries
//
//  Created by Subham  on 22/07/24.
//

import Foundation

extension String {
    var isValidEmail:Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with:self)
    }
}
