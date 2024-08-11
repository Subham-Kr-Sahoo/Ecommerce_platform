//
//  PromoCodeView.swift
//  Online-Groceries
//
//  Created by Subham  on 09/08/24.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var promoVM = PromocodeViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PromoCodeModel) -> () )?
    var column = [GridItem(.flexible(),spacing:10),
        GridItem(.flexible(),spacing:10)]
    @StateObject var cartVM = CartViewModel.shared
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(columns:column,spacing:5){
                    ForEach(promoVM.listArr,id:\.id){ coupon in
                        PromocodeCellView(promoObj: coupon)
                        .onTapGesture {
                            if(isPicker && coupon.end_date >= Date.now && coupon.min_order_amount < Int(Double(cartVM.total) ?? 0.0)) {
                                mode.wrappedValue.dismiss()
                                didSelect?(coupon)
                            }
                            if (isPicker && coupon.end_date < Date.now){
                                alertMessage = "Coupon is Expired"
                                showAlert = true
                            }
                            if (isPicker && coupon.end_date >= Date.now && coupon.min_order_amount > Int(Double(cartVM.total) ?? 0)){
                                alertMessage = "Minimum amount to use the coupon is ₹\(coupon.min_order_amount)"
                                showAlert = true
                            }
                        }
                        .alert(isPresented: $showAlert){
                            Alert(title: Text(Globs.AppName), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                    }
                }
            }
            .padding(.horizontal,10)
            .padding(.top,.topInsets+60)
            //back button and plus button
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
                    Text("My Rewards")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
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
    PromoCodeView()
}
