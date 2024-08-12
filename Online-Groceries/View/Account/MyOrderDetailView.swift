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
    @StateObject var detailVM: MyOrderDetailViewModel = MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [:]))
    @State var showWriteReview = false
    var body: some View {
        Text("")
    }
}

#Preview {
    MyOrderDetailView(detailVM: MyOrderDetailViewModel(prodObj: MyOrderModel(dict: ["order_id": 5,
                                                                                    "cart_id": "40,41",
                                                                                    "total_price": 177,
                                                                                    "user_pay_price": 158,
                                                                                    "discount_price": 21,
                                                                                    "deliver_price": 2,
                                                                                    "deliver_type": 1,
                                                                                    "payment_type": 2,
                                                                                    "payment_status": 1,
                                                                                    "order_status": 1,
                                                                                    "status": 1,
                                                                                    "user_name": "Subham Sahoo",
                                                                                    "phone": "9827542212",
                                                                                    "address": "Room no - 20 , Marichi hall of residence , Near VSSUT , Burla",
                                                                                    "city": "Sambalpur",
                                                                                    "state": "Odisha",
                                                                                    "postal_code": "768018",])))
}
