//
//  AddressRowView.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import SwiftUI

struct AddressRowView: View {
    @State var addressObj : AddressModel = AddressModel(dict:[:])
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text(addressObj.name)
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundStyle(.black)
                        .padding(.leading,4.5)
                        Spacer()

                    Image(systemName: addressObj.isDefault == 1 ? "checkmark.seal.fill" : "")
                        .foregroundStyle(Color.green)
                        .padding(.trailing,10)
                }
                VStack(spacing:4){
                    Text(addressObj.address)
                        .frame(minWidth:0,maxWidth:.screenWidth-60,alignment: .leading)
                    HStack{
                        Text(addressObj.city+", "+addressObj.state+", "+addressObj.postalCode)
                            .frame(minWidth:0,maxWidth:.screenWidth-60,alignment: .leading)
                    }
                    Text("Phone number: "+addressObj.phone)
                        .frame(minWidth:0,maxWidth:.screenWidth-60,alignment: .leading)
                    
                    Text("Type: "+addressObj.typeName)
                        .frame(minWidth:0,maxWidth:.screenWidth-60,alignment: .leading)
                }
                .font(.customfont(.medium, fontSize:16))
                .foregroundStyle(.black)
                .padding(.bottom,4)
                
                HStack{
                    NavigationLink{
                        AddDeliveryAddressView(isEdit: true,editObj: addressObj)
                    }label: {
                        Text("Edit")
                            .foregroundColor(.black)
                            .font(.customfont(.medium, fontSize: 18))
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius:8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )}
                    Button(action: {
                        addressVM.serviceCallRemove(Address:addressObj)
                    }) {
                        Text("Remove")
                            .foregroundColor(.black)
                            .font(.customfont(.medium, fontSize: 18))
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius:8)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Button(action: {
                        addressVM.serviceCallMarkasDefault(Address: addressObj)
                    }) {
                        Text(addressObj.isDefault == 1 ? "Remove as default" : "Set as Default")
                            .foregroundColor(.black)
                            .font(.customfont(.medium, fontSize: 18))
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius:8)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                    .padding(.trailing,8)
                }
                
            }
            .padding(.leading,10)
            .frame(width:.screenWidth-40,height:200,alignment:.center)
            .background{
                 RoundedRectangle(cornerRadius:25)
                    .fill(.gray.opacity(0.1))
            }
        }
        .frame(width:.screenWidth-40,height:210,alignment:.center)
        
    }
}

#Preview {
    NavigationView {
        AddressRowView(addressObj: AddressModel(dict:["address_id": 2,
                                                      "name": "Subham Sahoo",
                                                      "phone": "9827542212",
                                                      "address": "Room no - 20 , Marichi hall of residence , Near VSSUT , Burla",
                                                      "city": "Sambalpur",
                                                      "state": "Odisha",
                                                      "type_name": "Hostel",
                                                      "postal_code": "768018",
                                                      "is_default": 1]))
    }
}
