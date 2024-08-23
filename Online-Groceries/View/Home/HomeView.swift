//
//  HomeView.swift
//  Online-Groceries
//
//  Created by Subham  on 23/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    @StateObject var addVM = DeliveryAddressViewModel.shared
    var filetredAddress : [AddressModel] {
        return addVM.AddressArray.filter {$0.isDefault == 1}
    }
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    HStack(){
                        Image("color_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:25)
                            .padding(.bottom,4)
                        Spacer()
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width:23-3,height:23-3)
                            .padding(.bottom,4)
                            .padding(.trailing,0)
                            .foregroundStyle(Color(hex: "36454F"))
                        if filetredAddress.count > 0{
                            ForEach(filetredAddress){ address in
                                Text(address.city + "," + address.state)
                                    .font(.customfont(.medium, fontSize:20-4))
                                    .foregroundStyle(Color(hex: "36454F"))
                            }
                        }else{
                            VStack {
                                Text("           Add Your")
                                    .font(.customfont(.medium, fontSize:14))
                                    .foregroundStyle(Color(.systemGray4))
                                Text("Default Address")
                                    .font(.customfont(.medium, fontSize:14))
                                    .foregroundStyle(Color(.systemGray4))
                            }
                        }
                    }
                    .padding(.horizontal,30)
                    SearchTextField(txt: $homeVM.txtSearch)
                        .padding(.horizontal,23)
                        .padding(.bottom,-10)
                    
                    ImageSliderViews()
                    // MARK: Exclusive offer
                    SectionTitleView(title: "Exclusive offer",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    .padding(.vertical,-40)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(homeVM.offerArr,id: \.id){pObj in
                                ProductCellView(pObj: pObj,didAddCart: {
                                    CartViewModel.shared.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, message in
                                        self.homeVM.showError = true
                                        self.homeVM.errorMessage = message
                                    }
                                })
                            }
                        }.padding(.horizontal,25)
                    }
                    
                    // MARK: Best Selling
                    SectionTitleView(title: "Best Selling",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(homeVM.bestArr,id: \.id){pObj in
                                ProductCellView(pObj: pObj,didAddCart: {
                                    CartViewModel.shared.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, message in
                                        self.homeVM.showError = true
                                        self.homeVM.errorMessage = message
                                    }
                                })
                            }
                        }.padding(.horizontal,25)
                    }
                    
                    // MARK: Groceries
                    SectionTitleView(title: "Groceries",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    // category
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            
                            ForEach(homeVM.typeArr,id: \.id){
                                tObj in
                                
                                CategoryCellView(tObj: tObj){
                                    
                                }
                                
                            }
                            
                            
                        }.padding(.horizontal,25)
                    }
                    // product
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(homeVM.listArr,id: \.id){pObj in
                                ProductCellView(pObj: pObj,didAddCart: {
                                    CartViewModel.shared.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, message in
                                        self.homeVM.showError = true
                                        self.homeVM.errorMessage = message
                                    }
                                })
                            }
                        }.padding(.horizontal,25)
                    }
                }
                .padding(.top,.topInsets)
            }
        }.alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .ignoresSafeArea()
         .padding(.bottom,.bottomInsets+25)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
