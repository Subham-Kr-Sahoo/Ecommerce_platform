//
//  CartItemRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 05/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRowView: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    var body: some View {
        VStack{
            HStack(alignment:.center,spacing: 15){
                WebImage(url: URL(string: cObj.image ))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.trailing,20)
                Spacer()
                VStack{
                    HStack(alignment:.center,spacing:4){
                        Text(cObj.name)
                           .font(.customfont(.bold, fontSize: 16))
                           .foregroundColor(.primaryText)
                           .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           .frame(height:50,alignment:.bottom)
                        Button{
                            CartViewModel.shared.serviceCallRemove(cObj: cObj)
                        }label: {
                            Image(systemName: "trash.fill")
                                .resizable()
                                .frame(width:25,height:25)
                                .foregroundStyle(.red.opacity(0.7))
                        }
                        .padding([.trailing,.top],20)
                    }
                    Text("\(cObj.unitValue)"+" \(cObj.unitName)")
                        .font(.customfont(.semibold, fontSize:15))
                        .foregroundStyle(Color(hex:"7b7b7b"))
                        .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                        .padding(.leading,2)
                        .padding(.bottom)
                    
                    HStack {
                        Text("₹"+"\(cObj.totalPrice ?? cObj.price)")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.primaryText)
                        .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                        
                        Button{
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty-1)
                        }label: {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .frame(width:20+5,height:20+5)
                                .foregroundStyle(Color.pink.opacity(0.7))
                        }
                        .padding()
                        
                        Text("\(cObj.qty)")
                            .font(.customfont(.medium, fontSize: 20))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 25, height: 25, alignment: .center)
                        
                        Button{
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty+1)
                        }label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width:20+5,height:20+5)
                                .foregroundStyle(Color.primaryApp)
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
            .frame(width: .screenWidth,height:150)
        }
        .background{
            RoundedRectangle(cornerRadius:12)
                .frame(width:.screenWidth-14,height:150)
                .foregroundStyle(Color.gray.opacity(0.12))
        }
    }
}

#Preview {
CartItemRowView(cObj:CartItemModel(dict:["cart_id": 3,
                                         "user_id": 4,
                                         "prod_id": 4,
                                         "qty": 4,
                                         "cat_id": 1,
                                         "brand_id": 1,
                                         "type_id": 1,
                                         "name": "El primo",
                                         "detail": "El PRIMO BABY",
                                         "unit_name": "KG",
                                         "unit_value": "1",
                                         "nutrition_weight": "200g",
                                         "price": 3,
                                         "created_date": "2024-07-03T04:33:42.000Z",
                                         "modify_date": "2024-07-03T04:33:42.000Z",
                                         "cat_name": "fruits",
                                         "is_fav": 1,
                                         "brand_name": "bigies",
                                         "type_name": "BarbarianKing",
                                         "offer_price": 1,
                                         "start_date": "2024-07-10 00:00:00",
                                         "end_date": "2024-08-10 00:00:00",
                                         "is_offer_active": 1,
                                         "image": "http://localhost:3001/img/product/202407031003423424dnEQIw3cSCj4Hsev7Yp.png",
                                         "item_price": 1,
                                         "total_price": 4]))
}
