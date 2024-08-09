//
//  AddDeliveryAddressView.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    @State var editObj: AddressModel?
    var body: some View {
        ZStack {
            ScrollView{
                VStack{
                    VStack{
                        HStack{
                           typeview(title: "Home")
                           typeview(title: "Office")
                           typeview(title: "Hostel")
                        }
                        .padding(.horizontal,40/2)
                        .padding(.bottom,6)
                        textfieldview(title:"Full Name",placeholder:"First and Last Name", txt: $addressVM.txtName,keyboardType: .default,characterLimit:100)
                        textfieldview(title:"Mobile Number",placeholder:"10-digit mobile number without prefixes", txt: $addressVM.txtMobile,keyboardType: .numberPad, characterLimit:10)
                        textfieldview(title: "Address Line", placeholder:"Enter you address" , txt: $addressVM.txtAddress,keyboardType: .default,characterLimit:400)
                        HStack{
                            textfieldview(title:"Town/City",placeholder: "City",txt: $addressVM.txtCity,keyboardType: .default, characterLimit:50)
                            textfieldview(title: "Pin Code", placeholder: "6-digit Pin Code" , txt: $addressVM.txtPostalCode,keyboardType: .numberPad,characterLimit:6)
                        }
                        SheetView()
                            .padding(.horizontal,10)
                            .padding(.top,-12)
                    }
                }
            }
            .padding(.top,.topInsets+70)
            RoundedButton(title: isEdit ? "Update Address" : "Add Address") {
                if(isEdit) {
                    addressVM.serviceCallUpdateAddress(aObj:editObj) {
                        self.mode.wrappedValue.dismiss()
                    }
                }else{
                    addressVM.serviceCallAddAddress {
                        self.mode.wrappedValue.dismiss()
                    }
                }
            }
            .padding(.top,600)
            .padding(.horizontal)
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
                    Text(isEdit ? "Edit Delivery Address" :"Add Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .onTapGesture {
                            mode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
        }
        .onAppear{
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(addressObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(addressVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct typeview : View {
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    var title : String
    var body: some View {
        HStack {
            Button {
                addressVM.txtTypeName = title
            } label: {
                Image(systemName: addressVM.txtTypeName == title ? "record.circle" : "circle" )
            }
            .foregroundColor(.primaryText)
            Text(title)
                .font(.customfont(.medium, fontSize: 18))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct textfieldview : View {
    @State var title : String = "Title"
    @State var placeholder : String = "PlaceHolder"
    @Binding var txt : String
    @State var keyboardType : UIKeyboardType = .default
    var characterLimit : Int
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize:15))
                .foregroundStyle(Color.textTitle)
            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            .padding(.top)
            TextField(placeholder,text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .onChange(of: txt) { newValue in
                    if newValue.count > characterLimit {
                        txt = String(newValue.prefix(characterLimit))
                    }
                }
        }
        .padding(.horizontal,20)
        
    }
}

#Preview {
    AddDeliveryAddressView()
}
