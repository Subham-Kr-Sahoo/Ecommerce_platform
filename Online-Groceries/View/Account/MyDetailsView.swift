//
//  MyDetailsView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/08/24.
//

import SwiftUI
import CountryPicker

struct MyDetailsView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM = MyDetailsViewModel.shared
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 15){
                    LineTextField(title: "Name", placeholder: "Enter you name" , txt: $myVM.txtName)
                    VStack {
                        Text("Mobile")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        HStack{
                            Button {
                                myVM.isShowPicker = true
                                
                            } label: {
                                if let countryObj = myVM.countryObj {
                                    Text( "\( countryObj.isoCode.getFlag())")
                                        .font(.customfont(.medium, fontSize: 35))
                                    Text( "+\( countryObj.phoneCode )")
                                        .font(.customfont(.medium, fontSize: 18))
                                        .foregroundColor(.primaryText)
                                }
                            }
                            TextField("Enter you mobile number", text:  $myVM.txtMobile)
                                .keyboardType(.numberPad)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding(.bottom,4)
                        }
                        Divider()
                    }
                    LineTextField(title: "Username", placeholder: "Enter you username" , txt: $myVM.txtUsername)
                    RoundedButton(title: "Update") {
                        myVM.serviceCallUpdate()
                    }
                    .padding(.bottom, 45)
                    NavigationLink {
                        ChangePasswordView()
                    } label: {
                        Text("Change Password")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryApp)
                    }
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
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
                    Text( "My Details")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing,20)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2)
                Spacer()
            }
        }
        .sheet(isPresented: $myVM.isShowPicker, content: {
            CountryPicker(country: $myVM.countryObj)
        })
        .alert(isPresented: $myVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        MyDetailsView()
    }
}
