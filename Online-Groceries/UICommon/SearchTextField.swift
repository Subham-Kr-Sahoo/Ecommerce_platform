//
//  SearchTextField.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct SearchTextField: View {
    @State var placeholder: String = "Search 'Atta'"
    @Binding var txt: String
    @State private var currentPlaceholderIndex = 0
    @State var currentIndex : Int = 0
    @State var nextIndex: Int = 1
    private let placeholders = ["Search 'Milk'", "Search 'Eggs'", "Search 'Bread'", "Search 'Fruits'"]
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 8)
            
            TextField(placeholder, text: $txt)
                .font(.system(size: 20, weight: .semibold))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
                .animation(.easeInOut, value: txt)
        }
        .frame(height: 40)
        .padding(8)
        .background(Color(hex: "E5E4E2"))
        .cornerRadius(16)
        .onAppear {
            startPlaceholderAnimation()
        }
    }
    
    private func startPlaceholderAnimation() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            withAnimation(.easeIn){
                currentPlaceholderIndex = (currentPlaceholderIndex + 1) % placeholders.count
                placeholder = placeholders[currentPlaceholderIndex]
            }
        }
    }
}

#Preview {
    @State var text: String = ""
    return SearchTextField(txt: $text)
}

