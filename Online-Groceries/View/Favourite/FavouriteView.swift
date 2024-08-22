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
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(favVM.listArr,id:\.id){ fObj in
                        FavouriteRowView(fObj: fObj)
                    }
                }.padding(20)
            }.padding(.top,.topInsets+30)
            .padding(.bottom,.bottomInsets)
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
                
                if favVM.listArr.count > 0 {
                    RoundedButton(title:"Add to Cart"){
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom,.bottomInsets+80)
                }
            }
        }
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
