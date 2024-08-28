//
//  HelpPage.swift
//  Online-Groceries
//
//  Created by Subham  on 28/08/24.
//

import SwiftUI

struct HelpPageView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            ScrollView(showsIndicators:false){
                VStack(alignment: .leading, spacing: 20){
                      SectionsView(
                          title: "Welcome to Our E-Commerce App",
                          description: "Explore a wide range of products, add items to your cart, and enjoy a seamless shopping experience."
                      )
                      
                      SectionsView(
                          title: "Browsing Products",
                          description: "Use the search bar to find specific products or browse by categories. You can filter and sort products to find exactly what you're looking for."
                      )
                      
                      SectionsView(
                          title: "Product Details",
                          description: "Tap on any product to view its details, including descriptions, prices, reviews, and more. You can also view related products to discover similar items."
                      )
                      
                      SectionsView(
                          title: "Adding to Cart",
                          description: "To add an item to your cart, simply tap the 'Add to Cart' button on the product page. You can view your cart at any time by tapping the cart icon."
                      )
                      
                      SectionsView(
                          title: "Checkout Process",
                          description: "Ready to purchase? Tap the cart icon and proceed to checkout. You'll be guided through payment options and delivery details to complete your order."
                      )
                      
                      SectionsView(
                          title: "Managing Your Account",
                          description: "Sign in to access your account, view order history, manage addresses, and update payment methods. Ensure your details are up to date for a smooth shopping experience."
                      )
                      
                      SectionsView(
                          title: "Customer Support",
                          description: "Need help? Our customer support team is here to assist you. Visit the 'Support' section in the app or contact us directly for any inquiries."
                      )
                      SectionsView(
                          title: "Frequently Asked Questions",
                          description: """
                          1. How do I track my order?
                          You can track your order by visiting the 'Orders' section in your account.

                          2. Can I cancel my order?
                          Orders can be canceled before they are shipped. Go to 'Orders' and select the order you want to cancel.

                          3. What payment methods are accepted?
                          We accept various payment methods including credit cards, debit cards, and online payment gateways.

                          4. How do I return an item?
                          To return an item, go to 'Orders', select the item, and choose 'Return'. Follow the instructions provided.
                          """
                      )
                }
                .padding()
            }
            .padding(.top,.topInsets+46)
            .padding(.bottom,10)
            //MARK: back button and heading
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
                    Text("Help")
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

struct SectionsView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 5)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width:.screenWidth-30)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(16)
        
    }
}

#Preview {
    HelpPageView()
}
