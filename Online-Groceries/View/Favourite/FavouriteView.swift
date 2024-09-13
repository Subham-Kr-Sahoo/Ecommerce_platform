//
//  FavouriteView.swift
//  Online-Groceries
//
//  Created by Subham  on 02/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteView: View {
    @StateObject var favVM = FavouriteViewModel.shared
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
            if favVM.listArr.count != 0{
                ScrollView{
                    LazyVStack{
                        ForEach(favVM.listArr,id:\.id){ fObj in
                            FavouriteRowView(fObj: fObj,detailVM:ProductDetailViewModel(prodObj:fObj)) {
                                cartVM.serviceCallAddToCart(prodId: fObj.prodId, qty: 1) { isDone, message in
                                    self.favVM.showError = true
                                    self.favVM.errorMessage = message
                                }
                            }
                        }
                    }.padding(20)
                }.padding(.top,.topInsets+30)
                    .padding(.bottom,.bottomInsets)
            }
            else{
                Text("You have no favourites")
                    .font(.customfont(.medium, fontSize: 24))
            }
            VStack{
                HStack{
                    Spacer()
                    Text("Favourites")
                        .font(.customfont(.semibold, fontSize: 32))
                    Spacer()
                }
                .padding(.bottom,10)
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: .black.opacity(0.1), radius:30)
                Spacer()
                
            }
        }
        .alert(isPresented: $favVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(favVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .onAppear{
            favVM.serviceCallList()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        FavouriteView()
    }
}
