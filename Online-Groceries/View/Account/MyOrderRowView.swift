//
//  MyOrderRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 13/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrderRowView: View {
    @State var myObj : MyOrderModel = MyOrderModel(dict:[:])
    var body: some View {
        VStack{
            HStack {
                Text("Order No: #")
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                Text("\( myObj.id  )")
                    .font(.customfont(.bold, fontSize: 14))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Text(getOrderStatus(mObj: myObj))
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor( getOrderStatusColor(mObj: myObj) )
            }
            Text(myObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                .font(.customfont(.bold, fontSize: 12))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            HStack {
                if let imgageUrl = myObj.images.first {
                    WebImage(url: URL(string: imgageUrl ))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.trailing,10)
                }
                VStack{
                    HStack {
                        Text("Items:")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text(myObj.names)
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Text("Delivery Type:")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text( self.getDeliveryType(mObj: myObj) )
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Text("Payment Type:")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text(getPaymentType(mObj: myObj))
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Text("Payment Status:")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Text( getPaymentStatus(mObj: myObj))
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor( getPaymentStatusColor(mObj: myObj))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                
            }
            
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal,8)
    }
    
    func getOrderStatus(mObj: MyOrderModel) -> String {
            switch mObj.orderStatus {
            case 1:
                return "Placed"
            case 2:
                return "Accepted";
            case 3:
                return "Delivered";
            case 4:
                return "Cancel";
            case 5:
                return "Declined";
            default:
                return "";
            }
        }
        
    func getDeliveryType(mObj: MyOrderModel) -> String {
        switch mObj.deliverType {
        case 1:
              return "Delivery";
            case 2:
              return "Collection";
        default:
            return "";
        }
    }
    
    func getPaymentType(mObj: MyOrderModel) -> String {
        switch mObj.paymentType {
        case 1:
            return "Cash On Delivery";
        case 2:
            return "Online Card Payment";
        default:
            return "";
        }
    }
    
    func getPaymentStatus(mObj: MyOrderModel) -> String {
        switch mObj.paymentStatus {
        case 1:
            return "Processing";
        case 2:
            return "Success";
        case 3:
            return "Fail";
        case 4:
            return "Refunded";
        default:
            return "";
        }
    }
    
    func getPaymentStatusColor(mObj: MyOrderModel) -> Color {
        
        if (mObj.paymentType == 1) {
            return Color.orange;
        }
        
        switch mObj.paymentStatus {
        case 1:
            return Color.orange;
        case 2:
            return Color.green;
        case 3:
            return Color.red;
        case 4:
            return Color.green;
        default:
            return Color.white;
        }
    }
        
    func getOrderStatusColor(mObj: MyOrderModel) -> Color {
        
        switch mObj.orderStatus {
        case 1:
            return Color.orange;
        case 2:
            return Color.green;
        case 3:
            return Color.green;
        case 4:
            return Color.red;
        case 5:
            return Color.red;
        default:
            return Color.primaryApp;
            
        }
    }
}

#Preview {
    MyOrderRowView(myObj: MyOrderModel(dict: [            "order_id": 4,
                                                          "cart_id": "37",
                                                          "total_price": 6,
                                                          "user_pay_price": 8,
                                                          "discount_price": 0,
                                                          "deliver_price": 2,
                                                          "deliver_type": 1,
                                                          "payment_type": 1,
                                                          "payment_status": 1,
                                                          "order_status": 1,
                                                          "status": 1,
                                                          "created_date": "2024-08-11T22:05:16.000Z",
                                                          "names": "Wizard",
                                                          "images": "http://localhost:3001/img/product/2024070319565656563fxJquql86GwlQvA1ZVf.png,http://localhost:3001/img/product/202407031958255825kHFZwdbxZhW2dAHTtNmI.png,http://localhost:3001/img/product/20240703200018018TdrffTaXY231o6pubnxa.png,http://localhost:3001/img/product/20240703200254254OZhn9NKDM8U4SFfztoOt.png,http://localhost:3001/img/product/202407041020532053ISTRVGVJ1GZI0GG3nSP7.png",
                                                          "user_name": "Subham Sahoo",
                                                          "phone": "9827542212",
                                                          "address": "Room no - 20 , Marichi hall of residence , Near VSSUT , Burla",
                                                          "city": "Sambalpur",
                                                          "state": "Odisha",
                                                          "postal_code": "768018"]))
}
