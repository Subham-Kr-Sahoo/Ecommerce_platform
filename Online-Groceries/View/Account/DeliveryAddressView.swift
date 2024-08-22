//
//  DeliveryAddressView.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import SwiftUI

struct DeliveryAddressView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: AddressModel) -> () )?
    var body: some View {
        ZStack{
            if addressVM.AddressArray.count == 0 {
                Text("Add a Delivery Address")
                    .font(.customfont(.semibold, fontSize: 18))
            }else{
                ScrollView{
                    LazyVStack{
                        ForEach(addressVM.AddressArray,id:\.id){
                            AddObj in
                            AddressRowView(addressObj: AddObj)
                            .onTapGesture {
                                if(isPicker) {
                                    mode.wrappedValue.dismiss()
                                    didSelect?(AddObj)
                                }
                            }
                        }
                    }
                }
                .padding(.top,.topInsets+50)
            }
            //back button and plus button
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
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    NavigationLink {
                        AddDeliveryAddressView()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 8)
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
        DeliveryAddressView()
    }
}
