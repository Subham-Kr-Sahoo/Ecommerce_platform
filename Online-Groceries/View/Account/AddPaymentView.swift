//
//  AddPaymentView.swift
//  Online-Groceries
//
//  Created by Subham  on 10/08/24.
//

import SwiftUI

struct AddPaymentView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 15){
                    textfieldview(title: "Name", placeholder: "Full name as per card" , txt:$payVM.txtName,keyboardType: .default,characterLimit:100)
                    
                    textfieldview(title: "Card Number", placeholder: "Card Number - we dont keep your credentials" , txt:$payVM.txtCardNumber,keyboardType: .numberPad,characterLimit:16)
                    
                    HStack{
                        textfieldview(title: "Month", placeholder: "Expiring Month" ,txt:$payVM.txtCardMonth,keyboardType: .numberPad,characterLimit:2)
                        textfieldview(title: "Year", placeholder: "Expiring Year" ,txt:$payVM.txtCardYear,keyboardType: .numberPad,characterLimit:4)
                    }
                }
                .padding(.top, .topInsets + 46)
                RoundedButton(title:  "Add Payment Method"){
                    payVM.serviceCallAdd {
                        self.mode.wrappedValue.dismiss()
                    }
                }
                .padding(.top,100)
                .padding(.horizontal,15)
            }
            
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
                    Text("Add Payment Method")
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
        
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    AddPaymentView()
}
