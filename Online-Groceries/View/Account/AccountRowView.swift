//
//  AccountRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 07/08/24.
//

import SwiftUI

struct AccountRowView: View {
    @State var title: String = "Title"
    @State var icon: String = "bag"
    var body: some View {
        VStack{
           HStack(spacing: 15){
               Image(systemName:icon)
                   .resizable()
                   .scaledToFit()
                   .frame(width: 20, height: 20)
                   .foregroundStyle(.black)
               
               Text(title)
                   .font(.customfont(.semibold, fontSize: 18))
                   .foregroundColor(.primaryText)
                   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
               
               Image(systemName: "chevron.right")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 15, height: 15 )
                   .foregroundStyle(.black)
           }
           .padding(.horizontal, 20)
           .padding(.vertical, 15)
           Divider()
       }
    }
}


#Preview {
    AccountRowView()
}
