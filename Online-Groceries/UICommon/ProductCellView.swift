//
//  ProductCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCellView: View {
    @State var pObj : ProductModel = ProductModel(dict: [ : ])
    var didAddCart : (()->())?
    var body: some View {
            VStack{
                
                WebImage(url: URL(string:pObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width:100,height:80)

                Spacer()
            
                Text(pObj.name)
                    .font(.customfont(.semibold, fontSize:16))
                    .foregroundStyle(Color(hex:"3c3c3c"))
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                Text("\(pObj.unitValue)"+" \(pObj.unitName)")
                    .font(.customfont(.regular, fontSize:14))
                    .foregroundStyle(Color(hex:"7b7b7b"))
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                
                HStack{
                    if((pObj.offerPrice) != nil){
                        VStack{
                            Text("₹"+"\(pObj.offerPrice ?? pObj.price)")
                                
                            Text("₹"+"\(pObj.price)")
                                .strikethrough(true,color:.red)
                        }.font(.customfont(.semibold, fontSize:16)).frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    }else{
                        Text("₹"+"\(pObj.price)")
                        .font(.customfont(.semibold, fontSize:16))
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    }
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
    ProductCellView(pObj: ProductModel(dict:["offer_price": 1,
                                             "start_date": "2024-07-09T18:30:00.000Z",
                                             "end_date": "2024-08-09T18:30:00.000Z",
                                             "prod_id": 4,
                                             "cat_id": 1,
                                             "brand_id": 1,
                                             "type_id": 1,
                                             "name": "El primo",
                                             "detail": "El PRIMO BABY",
                                             "unit_name": "KG",
                                             "unit_value": "1",
                                             "nutrition_weight": "200g",
                                             "price": 3,
                                             "image": "http://localhost:3001/img/product/202407031003423424dnEQIw3cSCj4Hsev7Yp.png",
                                             "cat_name": "fruits",
                                             "type_name": "BarbarianKing",
                                             "is_fav": 0,
                                             "avg_rating": 5]))
}
