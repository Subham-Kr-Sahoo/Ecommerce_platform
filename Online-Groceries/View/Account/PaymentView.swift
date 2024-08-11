//
//  PaymentView.swift
//  Online-Groceries
//
//  Created by Subham  on 10/08/24.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PaymentModel) -> () )?
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(payVM.listArr,id:\.id){payObj in
                        PaymentRowView(CardObj:payObj)
                            .onTapGesture {
                            if(isPicker) {
                                mode.wrappedValue.dismiss()
                                didSelect?(payObj)
                            }
                        }
                    }
                }
            }
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
                    Text("Payment Methods")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    NavigationLink {
                        AddPaymentView()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 8)
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
    NavigationView {
        PaymentView()
    }
}
