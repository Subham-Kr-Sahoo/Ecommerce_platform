//
//  FavouriteRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 03/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteRowView: View {
    @State var fObj: ProductModel = ProductModel(dict: [:])
    var body: some View {
        VStack{
            HStack(spacing:15){
                WebImage(url: URL(string:fObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width:60,height:60)
                
                VStack(spacing:4){
                    Text(fObj.name)
                        .font(.customfont(.semibold, fontSize:16))
                        .foregroundStyle(Color(hex:"3c3c3c"))
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    Text("\(fObj.unitValue)"+" \(fObj.unitName)")
                        .font(.customfont(.regular, fontSize:14))
                        .foregroundStyle(Color(hex:"7b7b7b"))
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                }
                
                Text("₹"+"\(fObj.offerPrice ?? fObj.price)")
                .font(.customfont(.semibold, fontSize:18))
                .foregroundStyle(Color.primaryText)
                
                NavigationLink{
                    ProductDetailView(detailVM: ProductDetailViewModel(prodObj:fObj))
                }label: {
                    Image(systemName:"chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20,height:20)
                        .foregroundStyle(.black)
                }
            }
            if(fObj.offerPrice != nil){
                MarqueeTextView(text:"       Buy Now and Save More during Offer")
            }
            Divider()
        }
    }
}

#Preview {
    NavigationView {
        FavouriteRowView(fObj: ProductModel(dict:["offer_price": 1,
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
}
