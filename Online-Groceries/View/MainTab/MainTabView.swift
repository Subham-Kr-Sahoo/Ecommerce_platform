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
        VStack{
            TabView(selection:$homeVM.selectedTab){
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }.onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode:.never))
            .onChange(of: homeVM.selectedTab) {newValue in
                debugPrint("\(newValue)")
            }
            HStack{
                // MARK: home view
                TabButton(title: "Store",icon: "house",isSelect: homeVM.selectedTab == 0) {
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectedTab = 0
                        }
                    }
                }
                // MARK: explore view
                TabButton(title: "Explore",icon: "magnifyingglass",isSelect: homeVM.selectedTab == 1) {
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectedTab = 1
                        }
                    }
                }
                // MARK: favourite view
                TabButton(title: "Favourite",icon: "heart",isSelect: homeVM.selectedTab == 2) {
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectedTab = 2
                        }
                    }
                }
                // MARK: cart view
                TabButton(title: "Cart",icon: "cart",isSelect: homeVM.selectedTab == 3) {
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectedTab = 3
                        }
                    }
                }
                // MARK: account view
                TabButton(title: "Account",icon: "person.crop.square",isSelect: homeVM.selectedTab == 4) {
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectedTab = 4
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.bottom,.bottomInsets-5*3)
            .padding(.horizontal)
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

#Preview {
    MainTabView()
}
