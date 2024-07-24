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
    
    func stringDatetodate(format:String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.date(from: self)
    }
    
    func stringDateChangeFormat(format:String,newFormat:String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        if let dt = dateformat.date(from: self){
            dateformat.dateFormat = newFormat
            return dateformat.string(from: dt)
        }else{
            return ""
        }
    }
}


extension Date {
    func displayDate(format:String,addMinTime:Int = 0)->String{
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        let date = self.addingTimeInterval(TimeInterval(60*addMinTime))
        return dateformat.string(from: date)
    }
}

