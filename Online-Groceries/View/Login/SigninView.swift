//
//  SigninView.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI
import CountryPicker

struct SigninView: View {
    @State var txtMobile : String = ""
    @State var isShowPicker : Bool = false
    @State var countryObj : Country?
    var body: some View {
        ZStack(alignment:.top){
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth,height: .screenWidth)
                
                Spacer()
            }
            ScrollView(showsIndicators:false){
                VStack{
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize:38))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,30)
                        .padding(.top,10)
                    HStack{
                        
                        // country picker
                        
                        Button{
                            isShowPicker = true
                        }label: {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.semibold, fontSize:18+12))
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.semibold, fontSize:18))
                                    .foregroundColor(.primaryText)
                            }
                            
                        }
                        
                        TextField("Enter Mobile",text: $txtMobile)
                            .frame(minWidth:0,maxWidth:.infinity)
                            .keyboardType(.decimalPad)
 
                    }
                    .padding(.leading,12)
                    Divider()
                        .padding(.bottom,25)
                    
                    HStack{
                        Text("Already have an account ?")
                            .font(.customfont(.semibold, fontSize:18))
                            .foregroundStyle(Color.primaryText)
                        NavigationLink{
                            LoginView()
                        }label: {
                            if #available(iOS 16.0, *) {
                                Text("Log In")
                                    .font(.customfont(.semibold, fontSize:18))
                                    .foregroundStyle(Color.primaryApp)
                                    .underline()
                            } else {
                            Text("Log In")
                                .font(.customfont(.semibold, fontSize:18))
                                .foregroundStyle(Color.primaryApp)
                            }
                        }
                    }
                    .padding(.bottom,25)
                    
                    NavigationLink{
                        SignupView()
                    }label: {
                        HStack(alignment:.center){
                            Image("Email")
                                .resizable()
                                .frame(width:50,height: 50)
                                .padding(.bottom,4)
                            Text("Continue with Email")
                                .font(.customfont(.semibold, fontSize:20))
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.center)
                                .padding(.trailing,15)
                        }
                    }
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height:60)
                    .background(Color(hex:"e6e6e6"))
                    .cornerRadius(25)

                    
                    
                    Text("Or connect with social media")
                        .font(.customfont(.semibold,fontSize:18))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical,25)
                        
                }
                //MARK: continue with google
                
                Button{
                    
                }label: {
                    HStack(alignment:.center){
                        Image("Google_logo_on_button")
                            .resizable()
                            .frame(width:60+5,height: 50)
                            .padding(.bottom,4)
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize:20))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.trailing,15)
                    }
                }
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                .background(Color(hex:"000000"))
                .cornerRadius(25)
                
                //MARK: continue with facebook
                
                Button{
                    
                }label: {
                    HStack(alignment:.center){
                        Image("Facebook_logo_on_button")
                            .resizable()
                            .frame(width:50,height:50)
                            .padding(.bottom,4)
                            .padding(.leading,15)
                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize:20))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.leading,6)
                    }
                }
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                .background(Color(hex:"000000"))
                .cornerRadius(25)
                
                //MARK: continue with apple
                
                Button{
                    
                }label: {
                    HStack(alignment:.center){
                        Image("apple-xxl")
                            .resizable()
                            .frame(width:40,height:40)
                            .padding(.bottom,4)
                            .padding(.leading,-18)
                        Text("Continue with Apple")
                            .font(.customfont(.semibold, fontSize:20))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.leading,15)
                            
                    }
                }
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                .background(Color(hex:"000000"))
                .cornerRadius(25)
                
            }
                
                .padding(.horizontal,20)
                .frame(width:.screenWidth ,alignment: .leading)
                .padding(.top, .topInsets + .screenWidth*0.75)
                .padding(.bottom)
                
            
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "91", isoCode: "IN")
        }
        .sheet(isPresented: $isShowPicker){
            CountryPicker(country: $countryObj)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        SigninView()
    }
}
