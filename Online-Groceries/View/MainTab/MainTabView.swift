//
//  MainTabView.swift
//  Online-Groceries
//
//  Created by Subham  on 23/07/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        ZStack {
            if(homeVM.selectTab == 0) {
                    HomeView()
                    .padding(.bottom,10)
                }else if(homeVM.selectTab == 1) {
                    ExploreView()
                }else if(homeVM.selectTab == 2) {
                    FavouriteView()
                }else if(homeVM.selectTab == 3) {
                    MyCartView()
                }else if(homeVM.selectTab == 4) {
                    AccountView()
                }
            VStack{
                Spacer()
                HStack{
                    // MARK: home view
                    TabButton(title: "Store",icon: "house",isSelect: homeVM.selectTab == 0) {
                        DispatchQueue.main.async {
                            homeVM.selectTab = 0
                        }
                    }
                    // MARK: explore view
                    TabButton(title: "Explore",icon: "magnifyingglass",isSelect: homeVM.selectTab == 1) {
                        DispatchQueue.main.async {
                            homeVM.selectTab = 1
                        }
                    }
                    // MARK: favourite view
                    TabButton(title: "Favourite",icon: "heart",isSelect: homeVM.selectTab == 2) {
                        DispatchQueue.main.async {
                            homeVM.selectTab = 2
                        }
                    }
                    // MARK: cart view
                    TabButton(title: "Cart",icon: "cart",isSelect: homeVM.selectTab == 3) {
                        DispatchQueue.main.async {
                                homeVM.selectTab = 3
                        }
                    }
                    // MARK: account view
                    TabButton(title: "Account",icon: "person.crop.square",isSelect: homeVM.selectTab == 4) {
                        DispatchQueue.main.async {
                                homeVM.selectTab = 4
                        }
                    }.padding(.trailing,6+4)
                }
                .frame(width:.screenWidth,height:40)
                .padding(.vertical,.bottomInsets-10)
                .background(.white)
                .cornerRadius(100)
                .shadow(color: .black.opacity(0.2), radius: 10)
            }
             .ignoresSafeArea()
             .navigationTitle("")
             .navigationBarBackButtonHidden(true)
             .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationView{
        MainTabView()
    }
}
