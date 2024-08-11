//
//  CheckOutView.swift
//  Online-Groceries
//
//  Created by Subham  on 11/08/24.
//

import SwiftUI

struct CheckOutView: View {
    @StateObject var cartVM = CartViewModel.shared
    @Binding var isShow : Bool
    var body: some View {
        VStack {
            Spacer()
            VStack{
                HStack{
                    Text("Check Out")
                        .font(.customfont(.semibold, fontSize: 24))
                        .frame(height:46)
                    Spacer()
                    Button{
                        $isShow.wrappedValue = false
                    }label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width:25,height:25)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.top,20)
                Divider()
                VStack{
                    //MARK: delivery type check
                    HStack{
                        Text("Delivery Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .frame(height:35)
                            .foregroundStyle(Color.secondaryText)
                        
                        Spacer()
                        
                        Picker("", selection: $cartVM.deliveryType) {
                            Text("Delivery").tag(1)
                            Text("Pick Up").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width:150)
                    }
                    Divider()
                    // MARK: check for address
                    if cartVM.deliveryType == 1 {
                        NavigationLink{
                           DeliveryAddressView(isPicker:true,didSelect: {
                               aObj in
                               cartVM.deliverObj = aObj
                           })
                        }label: {
                            HStack{
                                Text("Delivery")
                                    .font(.customfont(.semibold,fontSize: 18))
                                    .frame(height:46)
                                    .foregroundStyle(Color.secondaryText)
                                
                                Spacer()
                                    Text(cartVM.deliverObj?.name ?? "Delivery Address")
                                        .font(.customfont(.medium, fontSize: 16))
                                        .frame(height:46)
                                    Image(systemName: "chevron.right")
                            }
                        }
                    }
                    Divider()
                    //MARK: payment type check
                    HStack{
                        Text("Payment Method")
                            .font(.customfont(.semibold, fontSize: 18))
                            .frame(height:35)
                            .foregroundStyle(Color.secondaryText)
                        Spacer()
                        Picker("", selection: $cartVM.paymentType) {
                            Text("Card").tag(2)
                            Text("Cash").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .frame(width:150)
                    }
                    Divider()
                    if cartVM.paymentType == 2 {
                        NavigationLink{
                        PaymentView(isPicker:true,didSelect:{
                                pObj in
                                cartVM.paymentObj = pObj
                            })
                        }label: {
                            HStack{
                                Text("Payment")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .frame(height:46)
                                    .foregroundStyle(Color.secondaryText)
                                Spacer()
                                    Text(cartVM.paymentObj?.cardNumber ?? "Card Details")
                                        .font(.customfont(.medium, fontSize: 16))
                                        .frame(height:46)
                                    Image(systemName: "chevron.right")
                            }
                        }
                        Divider()
                    }
                    //MARK: Promocode Details
                    NavigationLink{
                        PromoCodeView(isPicker:true) { couponObj in
                            cartVM.promoObj = couponObj
                        }
                    }label: {
                        HStack{
                            Text("Promocode")
                                .font(.customfont(.semibold, fontSize: 18))
                                .frame(height:35)
                                .foregroundStyle(Color.secondaryText)
                            
                            Spacer()
                            
                            Text(cartVM.promoObj?.code  ?? "Pick Discount")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(height:46)
                            Image(systemName: "chevron.right")
                        }
                    }
                    Divider()
                }
                VStack{
                    //total price of the product
                    HStack(spacing:4){
                        Text("Price")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text("+")
                            .padding(.bottom,3)
                        Text("₹"+"\(cartVM.total)")
                    }
                    //Coupon Discount
                    HStack(spacing:4){
                        Text("Discount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text("-")
                            .padding(.bottom,3)
                            .foregroundStyle(.green)
                        Text("₹"+"\(cartVM.discountAmount)")
                            .foregroundStyle(.green)
                    }
                    //Delivery Charge
                    HStack(spacing:4){
                        Text("Delivery Charges")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text("+")
                            .padding(.bottom,3)
                        Text("₹"+"\(cartVM.deliverPriceAmount)")
                    }
                    
                    Line()
                        .stroke(style: .init(dash: [7.9]))
                        .foregroundStyle(.gray)
                        .frame(height:1)
                    
                    HStack{
                        Text("Total Amount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text("₹"+"\(cartVM.userPayAmount)")
                    }
                    
                    HStack{
                        Text("Revised Total Amount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text("₹"+"\(revised(text: cartVM.userPayAmount))")
                    }
                    
                    Line()
                        .stroke(style: .init(dash: [7.9]))
                        .foregroundStyle(.gray)
                        .frame(height:1)
                    
                }
                VStack{
                    HStack(spacing:4){
                        Text("By continuing you agree to our")
                            .font(.customfont(.semibold, fontSize:15))
                            .foregroundStyle(Color.secondaryText)
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
                    }
                    .frame(minWidth: 0,maxWidth: .screenWidth,alignment: .leading)
                    HStack(spacing:4){
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
                RoundedButton(title: "Place Order"){
                    cartVM.serviceCallOrderPlace()
                }
                .padding(.bottom,100)
            }
            .padding(.horizontal,10)
            .background(Color.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
            
        }
    }
    func revised(text:String)->String{
        var value = text
        if value.count>=2{
            value.removeLast(2)
        }
        value.append("00")
        return value
    }
}
struct Line:Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var isShow: Bool = false;
    static var previews: some View {
        NavigationView {
            CheckOutView(isShow: $isShow)
        }
    }
}
