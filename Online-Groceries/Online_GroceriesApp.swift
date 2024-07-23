//
//  Online_GroceriesApp.swift
//  Online-Groceries
//
//  Created by Subham  on 18/06/24.
//

import SwiftUI

@main
struct Online_GroceriesApp: App {
    @StateObject var mainVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
        }
    }
}
