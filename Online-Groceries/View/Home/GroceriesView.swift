//
//  GroceriesView.swift
//  Online-Groceries
//
//  Created by Subham  on 05/09/24.
//

import SwiftUI

struct GroceriesView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var homeVM = HomeViewModel.shared
    var columns = [GridItem(.flexible(),spacing:-6),GridItem(.flexible(),spacing:-6)]
    var body: some View {
        ZStack{
            ScrollView(showsIndicators:false){
                LazyVGrid(columns:columns,spacing:15+5){
                    ForEach(homeVM.listArr,id:\.id){obj in
                        ProductCellView(pObj: obj){
                            CartViewModel.shared.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isDone, message in
                                self.homeVM.showError = true
                                self.homeVM.errorMessage = message
                            }
                        }
                    }
                }.padding(.top,116)
                 .padding(.bottom,20)
            }
            VStack {
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    Text("Groceries")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing,18)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                Spacer()
                
            }
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        GroceriesView()
    }
}
