//
//  PromocodeCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 09/08/24.
//

import SwiftUI

struct PromocodeCellView: View {
    @State var promoObj : PromoCodeModel = PromoCodeModel(dict: [:])
    private let pasteBoard = UIPasteboard.general
    @State private var sysytemImage : String = "doc.on.doc"
    var body: some View {
        if promoObj.end_date > Date.now {
            VStack{
                Image("C")
                    .resizable()
                    .frame(width:100,height:100)
                    .rotationEffect(.degrees(.pi*10*(-1)))
                    .padding(.bottom,10)
                HStack(alignment:.center){
                    Text(promoObj.code)
                        .font(.customfont(.semibold, fontSize: 18))
                        .padding(.leading,8)
                    Button{
                        copyToClipboard()
                    }label: {
                        Image(systemName: sysytemImage)
                            .resizable()
                            .frame(width:16,height:18)
                            .foregroundStyle(.black)
                            .padding(.bottom,3)
                            .padding(.leading,8)
                    }
                }
                .padding(.bottom,8)
                Text(promoObj.description + "on" + " Purchase above \(promoObj.min_order_amount)")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.medium, fontSize:14))
                    .padding(.horizontal,10)
                    
                HStack(spacing:0){
                    Text("Expires on ")
                        .font(.customfont(.medium, fontSize:14))
                    Text(promoObj.end_date.displayDate(format: "dd MMM YYYY"))
                        .font(.customfont(.semibold, fontSize:18))
                }
            }
            .frame(width:.screenWidth/2-10,height:.screenHeight/3.5)
            .background{
                RoundedRectangle(cornerRadius:25)
                    .fill(Color(hex: "98F797").opacity(0.7))
            }
        }else{
            ZStack {
                VStack{
                    Image("C-bg")
                        .resizable()
                        .frame(width:100,height:100)
                        .rotationEffect(.degrees(.pi*10*(-1)))
                        .padding(.bottom,10)
                        
                    VStack(spacing:6){
                        Text("Expired on ")
                            .font(.customfont(.medium, fontSize:14))
                        Text(promoObj.end_date.displayDate(format: "dd MMM YYYY"))
                            .font(.customfont(.semibold, fontSize:18))
                    }
                }
                .frame(width:.screenWidth/2-10,height:.screenHeight/3.5)
                .background{
                    RoundedRectangle(cornerRadius:25)
                        .fill(Color(hex: "CCCCCC"))
            }
            }
        }
    }
    func copyToClipboard(){
        pasteBoard.string = promoObj.code
        self.sysytemImage = "checkmark.circle"
        
        DispatchQueue.main.asyncAfter(deadline:.now()+4.0){
            self.sysytemImage = "doc.on.doc"
        }
    }
}

#Preview {
    PromocodeCellView(promoObj: PromoCodeModel(dict: ["promo_code_id": 1,
                                                      "code": "SAVE5",
                                                      "title": "Save 5% more",
                                                      "description": "get upto 5% off ",
                                                      "type": 1,
                                                      "min_order_amount": 100,
                                                      "max_discount_amount": 20,
                                                      "offer_price": 10,
                                                      "start_date": "2024-07-03T18:30:00.000Z",
                                                      "end_date": "2025-06-30T18:30:00.000Z",
                                                      ]))
}
