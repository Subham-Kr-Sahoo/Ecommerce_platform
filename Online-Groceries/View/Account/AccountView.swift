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
                        Image(systemName:"person.fill")
                            .resizable()
                            .frame(width:25,height:25)
                            .background{
                                Circle()
                                    .frame(width:60,height:60)
                                    .foregroundStyle(.gray.opacity(0.15))
                            }
                            .padding(.trailing,40)
                        VStack{
                            HStack {
                                Text(accVM.Name)
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundStyle(Color.primaryText)
                                
                                Image(systemName:"pencil")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                                    .padding([.bottom,.leading],4)
                                    .foregroundStyle(Color.primaryApp)
                            }
                            .frame(width:250,alignment: .leading)
                            Text(accVM.Email)
                                .font(.customfont(.regular, fontSize: 16))
                                .accentColor(.secondaryText)
                                .padding(.trailing,35)
                                .frame(width:250,alignment:.leading)
                        }
                        
                    }
                .padding(.bottom)
                .padding(.top,.topInsets+10)
                Divider()
                
                Spacer()
                
                ScrollView{
                    LazyVStack{
                        AccountRowView()
                    }
                }
                
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
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AccountView()
}
