//
//  ProductCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct ProductCellView: View {
    var didAddCart : (()->())?
    var body: some View {
            VStack{
                Image("ginger 1")
                    .resizable()
                    .scaledToFit()
                .frame(width:100,height:80)
                
                Spacer()
            
                Text("Ginger (Adrak)")
                    .font(.customfont(.semibold, fontSize:16))
                    .foregroundStyle(Color(hex:"3c3c3c"))
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                Text("200g")
                    .font(.customfont(.regular, fontSize:14))
                    .foregroundStyle(Color(hex:"7b7b7b"))
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                
                HStack{
                    Text("₹56")
                        .font(.customfont(.semibold, fontSize:16))
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    Button(action: {
                        didAddCart?()
                    }) {
                        Text("ADD")
                            .font(.customfont(.medium, fontSize:10))
                            .foregroundColor(Color(hex:"022602"))
                            .padding(.horizontal)
                            .padding(.vertical,8)
                            .background(Color(hex:"c8fcc7"))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius:8)
                                    .stroke(Color(hex:"044203"), lineWidth: 1.5)
                            )
                    }
                }
                .padding(.top,10)
            }
            .padding(15)
            .frame(width:160+10,height:200+12.5)
            .overlay {
                RoundedRectangle(cornerRadius:18)
                    .stroke(Color(hex: "777777").opacity(0.6),lineWidth:1)
            }
        }
    }
#Preview {
    ProductCellView()
}
