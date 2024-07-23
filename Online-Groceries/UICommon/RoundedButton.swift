//
//  RoundedButton.swift
//  Online-Groceries
//
//  Created by Subham  on 18/06/24.
//

import SwiftUI

struct RoundedButton: View {
    @State var title : String = "title"
    var didTap: (()->())?
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
                .font(.customfont(.semibold, fontSize:20))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                .background(Color.primaryApp)
                .cornerRadius(25)
        }
        
    }
}

#Preview {
    RoundedButton()
        .padding(20)
}
