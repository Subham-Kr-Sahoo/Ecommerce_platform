//
//  LoginView.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI

struct LoginView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:40)
                    .padding(.bottom, .screenWidth * 0.18)
                    
                Text("Login")
                    .font(.customfont(.semibold, fontSize:30))
                    .foregroundStyle(Color.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom,4)
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize:15))
                    .foregroundStyle(Color.secondaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                LineTextField(title: "Email", placeholder: "Enter your Email address", txt:$loginVM.txtEmail,keyboardType: .emailAddress)
                    .padding(.bottom,.screenWidth * 0.01)
                LineSecureField(txt:$loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword , title: "Password", placeholder: "Enter your Password")
                    .padding(.bottom,.screenWidth * 0.08)
                    
                Button{
                    
                }label: {
                    Text("Forgot Password ?")
                        .font(.customfont(.medium, fontSize:18))
                        .foregroundStyle(Color(hex: "4ba84a"))
                }
                .frame(minWidth: 0,maxWidth: .screenWidth,alignment: .trailing)
                .padding(.bottom,.screenWidth * 0.08)
                
                RoundedButton(title:"Log In"){
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom,.screenWidth * 0.02)
                    HStack{
                        Text("Don't have an account ?")
                            .font(.customfont(.semibold, fontSize:18))
                            .foregroundStyle(Color.primaryText)
                        NavigationLink{
                            SignupView()
                        }label: {
                            if #available(iOS 16.0, *) {
                                Text("Signup")
                                    .font(.customfont(.semibold, fontSize:18))
                                    .foregroundStyle(Color.primaryApp)
                                    .underline()
                            } else {
                            Text("Signup")
                                .font(.customfont(.semibold, fontSize:18))
                                .foregroundStyle(Color.primaryApp)
                            }
                        }
                    }
                Spacer()
            }
                .padding(.top,.topInsets + 70)
                .padding(.bottom,.bottomInsets)
                .padding(.horizontal,20)
            
            //MARK: back button
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height:20)
                    }
                    .padding(.top,50)
                    .padding(.leading,20+10)
                   Spacer()
                }
                Spacer()
            }
        }
        .alert(isPresented:$loginVM.showError){
            Alert(title: Text(Globs.AppName),message: Text(loginVM.errorMessage),dismissButton: .default(Text("Okay")))
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView{
        LoginView()
    }
}
