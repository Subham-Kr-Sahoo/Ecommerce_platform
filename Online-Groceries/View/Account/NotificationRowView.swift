//
//  NotificationRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 19/08/24.
//

import SwiftUI

struct NotificationRowView: View {
    @State var nObj : NotificationModel = NotificationModel(dict: [:])
    @StateObject var notiVM = NotificationViewModel.shared
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Text(nObj.title)
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text(nObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundColor(.secondaryText)
                }
                    Text(nObj.message)
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment( .leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
            .padding(15)
            .background(nObj.isRead == 2 ? Color.gray.opacity(0.1):Color.gray.opacity(0.5))
            .cornerRadius(5)
            .onTapGesture {
                notiVM.nObj = nObj
                notiVM.serviceCallReadOne()
            }
        }
    }
}

#Preview {
    NotificationRowView(nObj: NotificationModel(dict:["notification_id": 2,"ref_id": 2,"title": "Order payment fail","message": "your order #2 payment fail.","notification_type": 2,"is_read":2,
        "created_date": "2024-07-09T06:35:08.000Z"]))
}
