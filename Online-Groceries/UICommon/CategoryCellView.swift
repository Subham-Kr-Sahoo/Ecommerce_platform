//
//  CategoryCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct CategoryCellView: View {
    @State var colour : Color = Color.yellow
    var didAddCart : (()->())?
    var body: some View {
        HStack{
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width:70,height:70)
            
            Text("Pulses")
                .font(.customfont(.semibold, fontSize: 26))
                .foregroundStyle(Color(hex: "343434"))
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                .padding(.leading,20)
        }.padding(15)
            .frame(width:250,height: 100)
            .background(colour.opacity(0.4))
            .cornerRadius(20)
    }
}

#Preview {
    CategoryCellView()
}
