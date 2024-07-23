//
//  WelcomeView.swift
//  Online-Groceries
//
//  Created by Subham  on 18/06/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack{
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding(.bottom,8)
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize:50))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Text("Get your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize:15))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,20+10)
                
                NavigationLink {
                    SigninView()
                } label: {
                    Text("Get Started")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width:300+50,height:60)
                }
                .frame(width:350, height:60)
                .background( Color.primaryApp)
                .cornerRadius(20)
                
                Spacer()
                .frame(height: 100)
                
            }.padding(.horizontal,20)
            
        }.ignoresSafeArea()
         .navigationTitle("")
         .navigationBarBackButtonHidden(true)
         .navigationBarHidden(true)
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
