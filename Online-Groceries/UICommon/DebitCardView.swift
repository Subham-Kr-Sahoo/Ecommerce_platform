//
//  DebitCardView.swift
//  Online-Groceries
//
//  Created by Subham  on 05/08/24.
//

import SwiftUI

struct DebitCardView: View {
    @State var cardObj : PaymentModel = PaymentModel(dict:[:])
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var type : String = "Debit"
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .frame(width:.screenWidth-60,height:.screenHeight/4)
                HStack{
                    VStack{
                        HStack(alignment:.center){
                            Text("**** **** ****")
                                .font(.customfont(.medium, fontSize:30))
                            Text(cardObj.cardNumber)
                                .kerning(1.0)
                                .italic()
                                .padding(.bottom,18)
                        }
                        .foregroundStyle(.white)
                        Spacer()
                        
                        HStack(alignment:.center){
                            VStack {
                                Text("VALID")
                                    .kerning(0.3)
                                Text("UPTO")
                                    .kerning(0.3)
                            }
                            .font(.customfont(.medium, fontSize:10))
                            .foregroundStyle(.white.opacity(0.75))
                            .padding(.trailing,30)
                            Text(cardObj.cardMonth+"/"+cardObj.cardYear)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.trailing,80)
                        .padding(.bottom,10)
                        
                        Text(cardObj.name)
                            .kerning(1.0)
                            .textCase(.uppercase)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(.leading,-6)
                            .frame(width:200,height: 20,alignment: .leading)
                    }
                    .padding(.leading,20)
                    .padding(.top,80)
                    .padding(.bottom,20)
                    Spacer()
                    VStack {
                        Image(systemName: "dot.radiowaves.right")
                            .resizable()
                            .frame(width:20, height: 25)
                            .foregroundStyle(.white)
                            .padding(.leading,35)
                            .padding(.top,15)
                        
                        Spacer()
                        
                        Text(type)
                            .kerning(1)
                            .italic()
                            .textCase(.uppercase)
                            .foregroundStyle(.white)
                        
                    }
                    .frame(width:60)
                    .padding([.vertical,.trailing],20)
                }
                                
            }
            .frame(width:.screenWidth-60,height:.screenHeight/4)
            .padding(.bottom,100)
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
                    Text("Card Details")
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
    NavigationView {
        DebitCardView(cardObj: PaymentModel(dict: [            "pay_id": 4,
                                                               "name": "Ashutosh Maharana",
                                                               "card_number": "3434",
                                                               "card_month": "09",
                                                               "card_year": "2024"]))
    }
}
