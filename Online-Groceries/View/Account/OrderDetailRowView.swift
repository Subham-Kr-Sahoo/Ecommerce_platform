//
//  OrderDetailRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 13/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderDetailRowView: View {
    @State var pObj : OrderItemModel = OrderItemModel(dict:[:])
    var showReviewButton : Bool = false
    var didTap : (()->())?
    var body: some View {
        VStack {
            HStack(spacing: 15){
                WebImage(url: URL(string: pObj.image ))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                VStack(spacing: 4){
                    Text(pObj.name)
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text("\(pObj.unitValue)\(pObj.unitName)")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    HStack {
                        Text("QTY")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text(":")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .padding(.bottom,2)
                        Text("\( pObj.qty )")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text("×")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text("₹\(pObj.itemPrice)")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Text("₹\(pObj.totalPrice)")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
            }
            if showReviewButton {
                RoundedButton(title: "Write a review" ) {
                    didTap?()
                }
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.15), radius: 2)
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        
    }
}


#Preview {
    OrderDetailRowView()
}
