//
//  MonthYearView.swift
//  Online-Groceries
//
//  Created by Subham  on 31/07/24.
//

import SwiftUI

struct MonthYearView: View {
    @State private var currentMonth = Date()
        
    var body: some View {
        VStack {
            Text("\(formattedMonth)"+" \(formattedYear)")
                .font(.customfont(.medium, fontSize: 15))
        }
        .onAppear {
            startMonthChangeTimer()
        }
    }
    
    var formattedMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: currentMonth)
    }
    
    var formattedYear: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter.string(from: currentMonth)
    }
    func startMonthChangeTimer() {
        Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { _ in
            let newDate = Date()
            let calendar = Calendar.current
            let currentComponents = calendar.dateComponents([.month], from: currentMonth)
            let newComponents = calendar.dateComponents([.month], from: newDate)
            
            if currentComponents.month != newComponents.month {
                self.currentMonth = newDate
            }
        }
    }
}

#Preview {
    MonthYearView()
}
