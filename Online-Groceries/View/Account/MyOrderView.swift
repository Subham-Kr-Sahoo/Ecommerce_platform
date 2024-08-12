//
//  MyOrderView.swift
//  Online-Groceries
//
//  Created by Subham  on 13/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrderView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var myVM = MyOrdersViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(myVM.listArr,id: \.id){myObj in
                        NavigationLink{
                            
                        }label: {
                            MyOrderRowView(myObj: myObj)
                        }
                    }
                }
                .padding(.top, .topInsets + 50)
                .padding(.bottom, .bottomInsets + 60)
            }
            VStack{
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
                    Text("My Orders")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                Spacer()
                
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MyOrderView()
}
