//
//  ExploreView.swift
//  Online-Groceries
//
//  Created by Subham  on 23/07/24.
//

import SwiftUI

struct ExploreView: View {
    @State var txtSearch : String = ""
    @StateObject var exploreVM = ExploreViewModel.shared
    var columns = [
        GridItem(.flexible(),spacing:20),
        GridItem(.flexible(),spacing:20)
    ]
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Find Products")
                        .font(.customfont(.semibold, fontSize: 32))
                    Spacer()
                }
                .padding(.bottom,10)
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: .black.opacity(0.1), radius:30)
                
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
                }
                .frame(height: 40)
                .padding(8)
                .background(Color(hex: "E5E4E2"))
                .cornerRadius(16)
                .padding(.horizontal,12)
                .padding(.vertical,6)
                
                ScrollView{
                    LazyVGrid(columns: columns,spacing:20){
                        ForEach(exploreVM.listArr,id:\.id){ eObj in
                            NavigationLink{
                                ExploreItemView(itemsVM:ExploreItemViewModel(catObj: eObj))
                            }label: {
                                ExploreCategoryCellView(eObj: eObj)
                                    .aspectRatio(0.95,contentMode:.fill)
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .padding(.bottom,.bottomInsets+60)
                }
                
                Spacer()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
}
