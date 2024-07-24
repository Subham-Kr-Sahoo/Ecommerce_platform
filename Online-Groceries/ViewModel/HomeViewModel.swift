//
//  HomeViewModel.swift
//  Online-Groceries
//
//  Created by Subham  on 23/07/24.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    static var shared : HomeViewModel = HomeViewModel()
    @Published var selectedTab : Int = 0
    @Published var txtSearch : String = ""
}
