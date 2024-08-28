//
//  AboutView.swift
//  Online-Groceries
//
//  Created by Subham  on 28/08/24.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            ScrollView(showsIndicators:false){
                VStack(alignment: .leading, spacing: 20){
                    SectionsView(
                            title: "About Our Company",
                            description: "Welcome to nectar, your number one source for Groceries. We're dedicated to giving you the very best of groceries, with a focus on quality, customer service, and uniqueness."
                        )
                        
                        SectionsView(
                            title: "Our Mission",
                            description: "Our mission is to provide high-quality products that combine performance with value pricing, while establishing a successful relationship with our customers and our suppliers."
                        )
                        
                        SectionsView(
                            title: "Our Vision",
                            description: "To be a leader in the e-commerce industry by providing enhanced services, relationships, and profitability."
                        )
                        
                        SectionsView(
                            title: "Our Story",
                            description: "Founded in [Year] by [Founder Name], [Your Company Name] has come a long way from its beginnings in [Starting Location]. When [Founder Name] first started out, [his/her/their] passion for [industry type] drove [him/her/them] to start [their/his/her] own business."
                        )
                        
                        SectionsView(
                            title: "Meet the Team",
                            description: "Our team consists of passionate professionals dedicated to ensuring that your shopping experience is smooth and enjoyable. We're here to help!"
                        )
                        
                        SectionsView(
                            title: "Contact Us",
                            description: "Have any questions or concerns? Feel free to contact us via email at support@nectar.com or call us at +91 123-456-7890. We’re here to help!"
                        )
                        
                        Text("Thank you for choosing nectar. We hope you enjoy our products as much as we enjoy offering them to you.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.all,20)
                }
                    .padding()
            }
            .padding(.top,.topInsets+46)
            .padding(.bottom,10)
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
                    Text("About")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing,20)
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
    AboutView()
}
