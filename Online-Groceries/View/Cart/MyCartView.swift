//
//  MyCartView.swift
//  Online-Groceries
//
//  Created by Subham  on 02/08/24.
//

import SwiftUI

struct MyCartView: View {
    @StateObject var cartVM = CartViewModel.shared
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    var body: some View {
        ZStack{
             if(cartVM.listArr.count == 0) {
                 Text("Your Cart is Empty")
                     .font(.customfont(.bold, fontSize: 20))
             }
             else{
                ScrollView{
                    LazyVStack {
                        VStack(spacing:3){
                            Text("Price Details")
                                .font(.customfont(.semibold, fontSize: 18))
                                .frame(minWidth:0,maxWidth: .screenWidth,alignment: .leading)
                                .padding(.bottom,6)
                            HStack{
                                Text("Price (\(cartVM.listArr.count) items)")
                                Spacer()
                                Text("₹"+"\(cartVM.total)")
                            }
                            .font(.customfont(.medium, fontSize: 15))
                            .padding(.bottom,12)
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 1, alignment: .bottom)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 0)
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
                                        .foregroundColor(Color(UIColor.gray))
                                )
                                .padding(.bottom,12)
                            
                            HStack{
                                Text("Total Price")
                                Spacer()
                                Text("₹"+"\(cartVM.total)")
                            }
                            .padding(.bottom,6)
                            .font(.customfont(.medium, fontSize: 15))
                            MarqueeTextView(text:"This is not final price, delivery price and other prices can affect the total price.")
                        }
                        
                        ForEach( cartVM.listArr , id: \.id, content: {
                            cObj in
                            CartItemRowView(cObj: cObj)
                        })
                        .padding(.vertical,4)
                    }
                    .padding(20)
                    .padding(.top,100)
                }
            }
             
             VStack {
                 HStack{
                     Spacer()
                     Text("Cart")
                         .font(.customfont(.semibold, fontSize: 32))
                     Spacer()
                 }
                 .padding(.bottom,10)
                 .padding(.top,8)
                 .background(Color.white)
                 .shadow(color: .black.opacity(0.1), radius:30)
                 .padding(.top,.topInsets)
                 
                 
                 Spacer()
                 if(cartVM.listArr.count > 0) {
                     Button {
                         cartVM.showCheckout = true
                     } label: {
                         ZStack {
                             Text("Check Out")
                                 .font(.customfont(.semibold, fontSize: 18))
                                 .foregroundColor(.white)
                                 .multilineTextAlignment(.center)
                                 .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                                 .background( Color.primaryApp)
                                 .cornerRadius(20)
                                 .padding(.horizontal, 20)
                         }
                         
                     }
                     .padding(.bottom, .bottomInsets + 60)
                 }
                 
             }
             if(cartVM.showCheckout){
                 Color.black
                     .opacity(0.3)
                     .ignoresSafeArea()
                     .onTapGesture {
                         withAnimation {
                             cartVM.showCheckout = false
                         }
                     }
                 
                 CheckOutView(isShow: $cartVM.showCheckout)
                     .transition(.opacity.combined(with: .move(edge: .bottom)))
             }
         }
         .onAppear{
             cartVM.serviceCallList()
         }
         .alert(isPresented: $cartVM.showError, content: {
             Alert(title: Text(Globs.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")) )
         })
         .animation(.easeInOut, value: cartVM.showCheckout)
         .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        MyCartView()
    }
}
