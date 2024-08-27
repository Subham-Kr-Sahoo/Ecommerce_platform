//
//  MyOrderDetailView.swift
//  Online-Groceries
//
//  Created by Subham  on 13/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrderDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: MyOrderDetailViewModel = MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [:]) )
    var body: some View{
        ZStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("Order ID: # \(detailVM.pObj.id)")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text( getPaymentStatus(mObj: detailVM.pObj )  )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getPaymentStatusColor(mObj: detailVM.pObj))
                    }
                    HStack{
                        Text(detailVM.pObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text(getOrderStatus(mObj: detailVM.pObj))
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getOrderStatusColor(mObj: detailVM.pObj))
                    }
                    .padding(.bottom, 8)
                    Text("\(detailVM.pObj.address),\(detailVM.pObj.city), \(detailVM.pObj.state), \(detailVM.pObj.postalCode) ")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .multilineTextAlignment( .leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    HStack{
                        Text("Delivery Type:")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text( getDeliveryType(mObj: detailVM.pObj )  )
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    HStack{
                        Text("Payment Type:")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text( getPaymentType(mObj: detailVM.pObj )  )
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor( .primaryText )
                    }
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal,10)
                .padding(.top, .topInsets + 56)
                LazyVStack {
                    ForEach(detailVM.listArr, id: \.id) { pObj in
                        OrderDetailRowView(pObj: pObj, showReviewButton: detailVM.pObj.orderStatus == 3 && pObj.rating == 0){
                            detailVM.actionWriteReview(obj: pObj)
                        }
                    }
                }
                VStack{
                    HStack{
                        Text("Amount:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text("₹\(detailVM.pObj.totalPrice,specifier:"%.2f")")
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .primaryText)
                    }
                    .padding(.bottom, 4)
                    HStack{
                        Text("Delivery Cost:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text( "+ ₹\(detailVM.pObj.deliverPrice ?? 0.0,specifier:"%.2f")")
                            .font(.customfont(.medium,fontSize: 18))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.bottom, 4)
                    HStack{
                        Text("Discount Cost:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "- ₹\(detailVM.pObj.discountPrice ?? 0.0,specifier:"%.2f")")
                            .font(.customfont(.medium,fontSize:18))
                            .foregroundColor(.green)
                    }
                    .padding(.bottom, 4)
                    Line()
                        .stroke(style: .init(dash: [7.9]))
                        .foregroundStyle(.gray)
                        .frame(height:1)
                    HStack{
                        Text("Total:")
                            .font(.customfont(.semibold, fontSize: 22))
                            .foregroundColor(.primaryText)
                        Spacer()
                        Text( "₹\( detailVM.pObj.userPayPrice ?? 0.0,specifier:"%.2f")")
                            .font(.customfont(.semibold, fontSize: 22))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.bottom, 4)
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal,10)
                .padding(.vertical,4)
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
                    Text("Order Details")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                Spacer()
                
            }
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage), dismissButton: .default(Text("Ok"))  )
        })
        .background(NavigationLink(destination: WriteReviewView(myOrderVM: detailVM),isActive:$detailVM.showWriteReview,label: {
            EmptyView()
        }))
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
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
    NavigationView {
        MyOrderDetailView(detailVM: MyOrderDetailViewModel(prodObj: MyOrderModel(dict: ["order_id": 4,
                                                                                        "cart_id": 37,
                                                                                        "user_id": 4,
                                                                                        "prod_id": 1,
                                                                                        "qty": 1,
                                                                                        "cat_id": 1,
                                                                                        "brand_id": 1,
                                                                                        "type_id": 1,
                                                                                        "name": "Wizard",
                                                                                        "detail": "Wizard Baby",
                                                                                        "unit_name": "KG",
                                                                                        "unit_value": "2",
                                                                                        "nutrition_weight": "400g",
                                                                                        "price": 6,
                                                                                        "created_date": "2024-07-03T04:25:10.000Z",
                                                                                        "modify_date": "2024-07-03T04:25:10.000Z",
                                                                                        "cat_name": "fruits",
                                                                                        "is_fav": 0,
                                                                                        "brand_name": "bigies",
                                                                                        "type_name": "BarbarianKing",
                                                                                        "offer_price": 6,
                                                                                        "start_date": "",
                                                                                        "end_date": "",
                                                                                        "is_offer_active": 0,
                                                                                        "image": "http://localhost:3001/img/product/2024070319565656563fxJquql86GwlQvA1ZVf.png",
                                                                                        "item_price": 6,
                                                                                        "total_price": 6,
                                                                                        "rating": 0,
                                                                                        "review_message": ""])))
    }
}
