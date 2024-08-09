//
//  PaymentRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 10/08/24.
//

import SwiftUI

struct PaymentRowView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PaymentModel) -> () )?
    @State var CardObj : PaymentModel = PaymentModel(dict:[:])
    var body: some View {
        ZStack{
            HStack(spacing: 15) {
                NavigationLink{
                    DebitCardView(cardObj: CardObj)
                }label: {
                    Image("paymenth_methods")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                }
                VStack(spacing: 4){
                    Text(CardObj.name)
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text("**** **** **** \(CardObj.cardNumber) ")
                        .font(.customfont(.medium, fontSize: 15))
                        .foregroundColor(.primaryApp)
                        .multilineTextAlignment( .leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                Button {
                    payVM.serviceCallRemove(pObj:CardObj)
                } label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.15), radius: 2)
            .onTapGesture {
                if(isPicker) {
                    mode.wrappedValue.dismiss()
                    didSelect?(CardObj)
                }
            }
        }
        .padding(.horizontal,20)
        .padding(.vertical,5)
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}
    

#Preview {
    NavigationView {
        PaymentRowView()
    }
}
