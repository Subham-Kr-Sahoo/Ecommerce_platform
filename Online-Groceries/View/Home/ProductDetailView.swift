//
//  ProductDetailView.swift
//  Online-Groceries
//
//  Created by Subham  on 30/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var detailVM : ProductDetailViewModel = ProductDetailViewModel(prodObj:ProductModel(dict:[:]))
    var body: some View {
        ZStack{
            ScrollView{
                //MARK: image
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(hex: "F2F2F2"))
                        .frame(width:.screenWidth,height: .screenWidth)
                        .cornerRadius(60, corner: [.bottomLeft,.bottomRight,.topRight,.topLeft])
                    
                    WebImage(url: URL(string:detailVM.pObj.image))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width:.screenWidth*0.7,height:.screenWidth*0.7)
                }
                .frame(width: .screenWidth,height: .screenWidth)
                
                //MARK: name,like,number,price
                VStack{
                    HStack{
                        Text(detailVM.pObj.name)
                            .font(.customfont(.semibold, fontSize: 24))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                        Button{
                            withAnimation(.easeInOut){
                                detailVM.isFav.toggle()
                            }
                        }label: {
                            Image(systemName: detailVM.isFav ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width:25,height:25)
                                .foregroundStyle(detailVM.isFav ? .red : .gray)
                        }
                    }
                    
                    Text("\(detailVM.pObj.unitValue)"+" \(detailVM.pObj.unitName)")
                        .font(.customfont(.semibold, fontSize:15))
                        .foregroundStyle(Color(hex:"7b7b7b"))
                        .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                        .padding(.leading,2)
                    
                    HStack(spacing:20){
                        Button{
                            detailVM.addsubQty(isAdd: false)
                        }label: {
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
                                .foregroundStyle(Color.red)
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color(hex:"F2F2F2"))
                                .cornerRadius(8,corner:[.allCorners])
                                .frame(width:50,height:35)
                            Text("\(detailVM.qty)")
                                .font(.customfont(.semibold, fontSize:24))
                                .foregroundStyle(Color.primaryText)
                                .padding(.top,4)
                        }
                        .frame(width:50,height:40-5)
                        Button{
                            detailVM.addsubQty(isAdd: true)
                        }label:{
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
                                .foregroundStyle(Color.primaryApp)
                        }
                        Spacer()
                        Text("₹"+"\((detailVM.pObj.offerPrice ?? detailVM.pObj.price)*detailVM.qty)")
                            .font(.customfont(.semibold, fontSize: 30))
                            .foregroundStyle(Color.primaryText)
                    }
                    .padding(.top,8)
                    .padding(.bottom,10)
                    
                    Divider()
                }
                .padding(20)
                //MARK: product details
                VStack{
                    HStack{
                        Text("Product Details")
                            .font(.customfont(.semibold, fontSize: 24))
                            .foregroundStyle(Color.primaryText)
                            .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                        Button{
                            withAnimation {
                                detailVM.showDetail()
                            }
                        }label: {
                            Image(systemName:"chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20,height:20)
                                .foregroundStyle(.black)
                                .rotationEffect(.degrees(detailVM.isShowDetail ? 90 : 0), anchor: .center)
                                .animation(.easeInOut(duration:0.2), value: detailVM.isShowDetail)
                        }
                    }
                    if(detailVM.isShowDetail){
                        VStack(spacing:12){
                            Text(detailVM.pObj.detail)
                                .font(.customfont(.medium, fontSize:16))
                                .foregroundStyle(Color.secondaryText)
                                .frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                            
                            HStack{
                                Text("FSSAI License")
                                    .font(.customfont(.semibold, fontSize:16))
                                    .foregroundStyle(Color.primaryText)
                                Spacer()
                                Text("27384950612748")
                                    .font(.customfont(.medium, fontSize:16))
                                    .foregroundStyle(Color.secondaryText)
                            }.frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                            
                            HStack{
                                Text("Country Of Origin")
                                    .font(.customfont(.semibold, fontSize:16))
                                    .foregroundStyle(Color.primaryText)
                                Spacer()
                                Text("India")
                                    .font(.customfont(.medium, fontSize:16))
                                    .foregroundStyle(Color.secondaryText)
                            }.frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                            
                            HStack{
                                Text("Customer Care Details")
                                    .font(.customfont(.semibold, fontSize:16))
                                    .foregroundStyle(Color.primaryText)
                                Spacer()
                                Text("info@necter.com")
                                    .font(.customfont(.medium, fontSize:16))
                                    .foregroundStyle(Color.secondaryText)
                            }.frame(minWidth:0,maxWidth:.screenWidth,alignment: .leading)
                            
                            VStack{
                                Text("Return Policy")
                                    .font(.customfont(.semibold, fontSize:16))
                                    .foregroundStyle(Color.primaryText)
                                    .frame(minWidth:0,maxWidth:.screenWidth,alignment:.leading)
                                Spacer()
                                Text("The product is non-returnable. For a damaged packet, rotten or incorrect item, you can request a replacement within 48 hours of delivery.\nIn case of an incorrect item, you may raise a replacement or return request only if the item is sealed/ unopened/ unused and in original condition.")
                                    .font(.customfont(.medium, fontSize:16))
                                    .foregroundStyle(Color.secondaryText)
                            }
                            
                            VStack{
                                Text("Disclaimer")
                                    .font(.customfont(.semibold, fontSize:16))
                                    .foregroundStyle(Color.primaryText)
                                    .frame(minWidth:0,maxWidth:.screenWidth,alignment:.leading)
                                Spacer()
                                Text("Every effort is made to maintain the accuracy of all information. However, actual product packaging and materials may contain more and/or different information.\nIt is recommended not to solely rely on the information presented.")
                                    .font(.customfont(.medium, fontSize:16))
                                    .foregroundStyle(Color.secondaryText)
                            }
                        }
                    }
                    Divider()
                        .padding(.top,20)
                }.padding([.horizontal],20)
                //MARK: nutrition details
                
            }
            //MARK: back button and share button
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height:20)
                    }
                    .padding(.top,50)
                    .padding(.leading,20+10)
                   Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName:"link")
                            .resizable()
                            .scaledToFit()
                            .frame(width:20+10,height:20+10)
                            .foregroundStyle(.black)
                    }
                    .padding(.top,50)
                    .padding(.trailing,20+10)
                }
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: ["offer_price":1,
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
        "avg_rating": 5
    ])))
}
