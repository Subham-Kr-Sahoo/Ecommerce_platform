//
//  ExploreItemView.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import SwiftUI

struct ExploreItemView: View {
    @State private var selectedCategory : ProductEnum? = nil
    @State var txtSearch : String = ""
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreModel(dict: [:]))
    var columns = [GridItem(.flexible(),spacing:8),GridItem(.flexible(),spacing:8)]
    var productArray : [ProductModel] {
        if selectedCategory == .priceHightoLow{
            if txtSearch.isEmpty{
                return itemsVM.listArr.sorted {$0.price > $1.price}
            }else{
                return itemsVM.listArr.sorted {$0.price > $1.price}.filter{$0.name.lowercased().contains(txtSearch.lowercased())}
            }
        }
        if selectedCategory == .priceLowtoHigh && txtSearch.isEmpty {
            if txtSearch.isEmpty{
                return itemsVM.listArr.sorted {$0.price < $1.price}
            }else{
                return itemsVM.listArr.sorted {$0.price < $1.price}.filter{$0.name.lowercased().contains(txtSearch.lowercased())}
            }
        }
        if txtSearch.isEmpty {
            return itemsVM.listArr
        }
        else{
            return itemsVM.listArr.filter{$0.name.lowercased().contains(txtSearch.lowercased())}
        }
    }
    var body: some View {
        ZStack{
            VStack{
               //MARK: back button and share button
               HStack{
                   Button{ 
                       mode.wrappedValue.dismiss()
                   }label:{
                       Image("back")
                           .resizable()
                           .scaledToFit()
                           .frame(width:20,height:20)
                   }
                   .padding(.top,50)
                   .padding(.leading,20+10)
                   Text(itemsVM.eiObj.name)
                       .font(.customfont(.bold, fontSize: 32))
                       .padding(.top,.topInsets)
                       .frame(minWidth:0,maxWidth:.screenWidth,alignment: .center)
                   Menu{
                       Button{
                           selectedCategory = nil
                       }label: {
                           HStack{
                               Text("Featured")
                               if selectedCategory == nil{
                                   Image(systemName: "checkmark")
                               }
                           }
                       }
                       Button{
                           selectedCategory = .priceHightoLow
                       }label: {
                           HStack{
                               Text("Price High to Low")
                               if selectedCategory == .priceHightoLow {
                                   Image(systemName: "checkmark")
                               }
                           }
                       }
                       Button{
                           selectedCategory = .priceLowtoHigh
                       }label: {
                           HStack{
                               Text("Price Low to High")
                               if selectedCategory == .priceLowtoHigh {
                                   Image(systemName: "checkmark")
                               }
                           }
                       }
                   }label: {
                       Image(systemName:"line.3.horizontal.decrease.circle")
                           .resizable()
                           .scaledToFit()
                           .frame(width:25,height:25)
                           .foregroundStyle(.black)
                   }
                   .padding(.top,50)
                   .padding(.trailing,20+10)
               }
                //MARK: search bar
                HStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 8)
                    
                    TextField("Search Products", text: $txtSearch)
                        .font(.system(size: 20, weight: .semibold))
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Spacer()
                    if(!txtSearch.isEmpty){
                        Button{
                            txtSearch = ""
                        }label: {
                            Image(systemName:"multiply")
                                .foregroundStyle(.pink.opacity(0.7))
                                .padding(.trailing,10)
                        }
                    }
                }
                .frame(height: 40)
                .padding(8)
                .background(Color(hex: "E5E4E2"))
                .cornerRadius(16)
                .padding(.horizontal,12)
                .padding(.vertical,6)
               //MARK: Products lineup
                ScrollView(showsIndicators:false){
                    LazyVGrid(columns:columns,spacing:15){
                        ForEach(productArray,id:\.id){obj in
                            ProductCellView(pObj: obj){
                                CartViewModel.shared.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isDone, message in
                                    self.itemsVM.showError = true
                                    self.itemsVM.errorMessage = message
                                }
                            }
                        }
                    }
                }.padding(.top,10)
                .padding(.bottom,20)
               Spacer()
           }
        }
        .alert(isPresented: $itemsVM.showError, content: {
                    Alert(title: Text(Globs.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")))})
        .padding(.horizontal)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreItemView(itemsVM: ExploreItemViewModel(catObj:ExploreModel(dict:["cat_id": 1,
                                                          "cat_name": "fruits",
                                                          "image": "http://localhost:3001/img/category/2024070219520252210jAn7vGeGaI2iZzBfzj.png",
                                                                                "color": "F8A446"])))
    }
}
