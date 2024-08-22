//
//  SignupView.swift
//  Online-Groceries
//
//  Created by Subham  on 22/07/24.
//

import SwiftUI

struct SignupView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var signupVM = MainViewModel.shared
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .frame(width:.screenWidth,height:.screenHeight)
            
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40)
                        .padding(.bottom, .screenWidth * 0.1)
                        
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize:30))
                        .foregroundStyle(Color.primaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,4)
                    Text("Enter your details")
                        .font(.customfont(.semibold, fontSize:15))
                        .foregroundStyle(Color.secondaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField(title: "Username", placeholder: "Enter your Username", txt:$signupVM.txtUsername,keyboardType: .default)
                        .padding(.bottom,.screenWidth * 0.01)
                    LineTextField(title: "Email", placeholder: "Enter your Email address", txt:$signupVM.txtEmail,keyboardType: .emailAddress)
                        .padding(.bottom,.screenWidth * 0.01)
                    LineSecureField(txt:$signupVM.txtPassword, isShowPassword: $signupVM.isShowPassword , title: "Password", placeholder: "Enter your Password")
                        .padding(.bottom,.screenWidth * 0.08)
                
                    VStack{
                        Text("By continuing you agree to our")
                            .font(.customfont(.semibold, fontSize:15))
                            .foregroundStyle(Color.secondaryText)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        HStack(spacing:4){
                            NavigationLink{
                                TermsofServiceView()
                            }label: {
                                Text("Terms of Service")
                                    .font(.customfont(.semibold, fontSize:15))
                                    .foregroundStyle(Color(hex: "4ba84a"))
                            }
                            
                            
                            Text("and")
                                .font(.customfont(.semibold, fontSize:15))
                                .foregroundStyle(Color.secondaryText)
                            NavigationLink{
                                PrivacyPolicyView()
                            }label: {
                                Text("Privacy Policy")
                                    .font(.customfont(.semibold, fontSize:15))
                                    .foregroundStyle(Color(hex: "4ba84a"))
                            }
                            
                        }.frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                    }
                    .padding(.bottom,15)
            
                    RoundedButton(title:"Sign Up"){
                        signupVM.serviceCallSignup()
                    }
                    .padding(.bottom,.screenWidth * 0.02)
                        HStack{
                            Text("Already have an account ?")
                                .font(.customfont(.semibold, fontSize:18))
                                .foregroundStyle(Color.primaryText)
                            NavigationLink{
                                LoginView()
                            }label: {
                                if #available(iOS 16.0, *) {
                                    Text("Login")
                                        .font(.customfont(.semibold, fontSize:18))
                                        .foregroundStyle(Color.primaryApp)
                                        .underline()
                                } else {
                                Text("login")
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
                
            }
            
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
            
        }.alert(isPresented: $signupVM.showError,content: {
            Alert(title: Text(Globs.AppName),message: Text(signupVM.errorMessage),dismissButton: .default(Text("Okay")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        SignupView()
    }
}
