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
    var filterProduct : [ProductModel] {
        let newArr = homeVM.offerArr + homeVM.listArr + homeVM.bestArr
        let emptyArr : [ProductModel] = []
        if !homeVM.txtSearch.isEmpty {
            return newArr.filter {$0.name.lowercased().hasPrefix(homeVM.txtSearch.lowercased())}
        }
        else{
            return emptyArr
        }
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
                                Text(address.city + ", " + address.state)
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
                    HStack {
                        SearchTextField(txt: $homeVM.txtSearch)
                            .padding(.horizontal,23)
                            .padding(.bottom,-10)
                        
                        if !homeVM.txtSearch.isEmpty{
                            Button{
                                withAnimation(.easeInOut){
                                    homeVM.txtSearch = ""
                                }
                            }label: {
                                Image(systemName:"trash")
                                    .resizable()
                                    .frame(width:25,height:25)
                                    .foregroundStyle(.pink.opacity(0.7))
                                    .padding(.trailing,20)
                                    .padding(.leading,-20)
                            }
                        }
                    }
                    
                    if !homeVM.txtSearch.isEmpty{
                            ScrollView(.horizontal,showsIndicators: false){
                                LazyHStack(spacing:10){
                                    ForEach(filterProduct,id: \.id){pObj in
                                        ProductCellView(pObj: pObj,didAddCart: {
                                            CartViewModel.shared.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, message in
                                                self.homeVM.showError = true
                                                self.homeVM.errorMessage = message
                                            }
                                        })
                                    }
                                }.padding(.horizontal,25)
                                .padding(.top,10)
                                .padding(.bottom,0)
                        }
                    }
                    
                    ImageSliderViews()
                        .padding(.bottom,homeVM.offerArr.count == 0 ? -30 : 0)
                    // MARK: Exclusive offer
                    if homeVM.offerArr.count > 0 {
                        HStack {
                            SectionTitleView(title: "Exclusive offer"){
                                
                            }.padding(.horizontal,10)
                                .padding(.vertical,-40)
                            
                            NavigationLink{
                                BestSellingView()
                            }label: {
                                Text("See All")
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundStyle(Color.primaryApp)
                                    .frame(height:40)
                                    .padding(.trailing,25)
                                    .padding(.vertical,-40)
                            }
                        }
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
                    }
                    // MARK: Best Selling
                    if homeVM.bestArr.count > 0 {
                        HStack {
                            SectionTitleView(title: "Best Selling"){
                                
                            }.padding(.horizontal,10)
                            
                            NavigationLink{
                                BestSellingView()
                            }label: {
                                Text("See All")
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundStyle(Color.primaryApp)
                                    .frame(height:40)
                                    .padding(.trailing,25)
                            }
                            
                        }
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
                    }
                    // MARK: Groceries
                    HStack {
                        SectionTitleView(title: "Groceries"){
                            
                        }.padding(.horizontal,10)
                        
                        NavigationLink{
                            BestSellingView()
                        }label: {
                            Text("See All")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundStyle(Color.primaryApp)
                                .frame(height:40)
                                .padding(.trailing,25)
                        }
                    }
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
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .padding(.bottom,.bottomInsets+25)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
