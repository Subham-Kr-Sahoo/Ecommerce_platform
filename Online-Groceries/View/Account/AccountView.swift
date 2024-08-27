//
//  AccountView.swift
//  Online-Groceries
//
//  Created by Subham  on 02/08/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accVM = UserNameViewModel.shared
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment:.center){
                        ImageChoiceView()
                        .padding(.leading,30)
                      Spacer()
                        VStack{
                            HStack {
                                Text(accVM.Name)
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundStyle(Color.primaryText)
                                    .frame(width: 180,alignment:.trailing)
                            }
                            Text(accVM.Email)
                                .font(.customfont(.regular, fontSize: 16))
                                .accentColor(.secondaryText)
                                .frame(width: 180,alignment:.trailing)
                        }
                        .padding(.trailing,20)
                        .onAppear(perform: {
                            accVM.serviceCallName()
                        })
                        
                    }
                .padding(.bottom)
                .padding(.top,.topInsets+10)
                Divider()
                
                Spacer()
                
                ScrollView{
                    LazyVStack{
                        VStack{
                            NavigationLink{
                                MyOrderView()
                            }label: {
                                AccountRowView(title:"Orders",icon:"bag")
                            }
                            NavigationLink{
                                MyDetailsView()
                            }label: {
                                AccountRowView(title:"My Details",icon:"person.text.rectangle")
                            }
                            NavigationLink{
                                DeliveryAddressView()
                            }label: {
                                AccountRowView(title:"Delivery Address",icon:"mappin.and.ellipse")
                            }
                            NavigationLink{
                                PaymentView()
                            }label: {
                                AccountRowView(title:"Payment Methods",icon:"creditcard.and.123")
                            }
                            NavigationLink{
                                PromoCodeView()
                            }label: {
                                AccountRowView(title:"Promo Code",icon:"giftcard")
                            }
                            NavigationLink{
                                NotificationView()
                            }label: {
                                AccountRowView(title:"Notification",icon:"bell")
                            }
                            AccountRowView(title:"Help",icon:"questionmark.circle")
                            AccountRowView(title:"About",icon:"exclamationmark.circle")
                            
                            Button{
                                MainViewModel.shared.logout()
                            }label: {
                                ZStack{
                                    Text("Log Out")
                                        .font(.customfont(.semibold, fontSize: 22))
                                        .foregroundStyle(Color.primaryApp)
                                        .multilineTextAlignment(.center)
                                    HStack{
                                        Spacer()
                                        Image(systemName:"rectangle.portrait.and.arrow.right")
                                            .resizable()
                                            .foregroundStyle(Color.primaryApp)
                                            .scaledToFit()
                                            .frame(width:25,height:25)
                                            .padding(.trailing,30)
                                    }
                                }
                            }
                            .frame(minWidth:0,maxWidth:.infinity,minHeight: 60,maxHeight:60)
                            .background( Color.black.opacity(0.05))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                        }
                    }
                }
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        AccountView()
    }
}
