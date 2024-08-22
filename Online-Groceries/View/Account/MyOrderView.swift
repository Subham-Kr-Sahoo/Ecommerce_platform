//
//  MyOrderView.swift
//  Online-Groceries
//
//  Created by Subham  on 13/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrderView : View {
    @StateObject var homeVM = HomeViewModel.shared
    @State private var navigate = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var myVM = MyOrdersViewModel.shared
    var body: some View {
        ZStack{
            if myVM.listArr.count == 0 {
                VStack {
                    Text("You have no recent orders")
                        .font(.customfont(.medium, fontSize: 18))
                        .padding(.bottom,12)
                    Button(action: {
                        navigate = true
                        homeVM.selectTab = 0
                    }) {
                        Text("Return to Home Page")
                            .foregroundColor(.black)
                            .font(.customfont(.medium, fontSize: 18))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius:8)
                                    .stroke(Color.gray, lineWidth: 1)
                                )
                    }
                    .background(
                        NavigationLink(destination: MainTabView(), isActive: $navigate) {
                            EmptyView()
                        }
                        .hidden()
                    )
                }
            }else{
                ScrollView{
                    LazyVStack{
                        ForEach(myVM.listArr,id: \.id){myObj in
                            NavigationLink{
                                MyOrderDetailView(detailVM: MyOrderDetailViewModel(prodObj:myObj))
                            }label: {
                                MyOrderRowView(myObj: myObj)
                            }
                        }
                    }
                    .padding(.top, .topInsets + 50)
                    .padding(.bottom, .bottomInsets + 60)
                }
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
    NavigationView{
        MyOrderView()
    }
}
