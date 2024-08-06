//
//  DebitCardView.swift
//  Online-Groceries
//
//  Created by Subham  on 05/08/24.
//

import SwiftUI

struct DebitCardView: View {
    @State var name : String = "Subham Sahoo"
    @State var card_number : String = "6767"
    @State var card_month : String = "10"
    @State var card_year : String = "26"
    @State var type : String = "Debit"
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .frame(width:.screenWidth-60,height:.screenHeight/4)
            HStack {
                VStack{
                    HStack(alignment:.center){
                        Text("**** **** ****")
                            .font(.customfont(.medium, fontSize:30))
                        Text(card_number)
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
                        Text(card_month+"/"+card_year)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.trailing,80)
                    .padding(.bottom,10)
                    
                    Text(name)
                        .kerning(1.0)
                        .textCase(.uppercase)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(.trailing,65)
                        
                    
                    
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
                    
                    if #available(iOS 16.0, *) {
                        Text(type)
                            .textCase(.uppercase)
                            .italic()
                            .foregroundStyle(.white)
                            .kerning(1)
                    } else {
                        Text(type)
                            .textCase(.uppercase)
                            .foregroundStyle(.white)
                    }
                    
                }
                .frame(width:60)
                .padding([.vertical,.trailing],20)
            }
                
            
            
        }
        .frame(width:.screenWidth-60,height:.screenHeight/4)
    }
}

#Preview {
    DebitCardView()
}
