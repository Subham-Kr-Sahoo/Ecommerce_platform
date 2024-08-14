//
//  SheetView.swift
//  Online-Groceries
//
//  Created by Subham  on 09/08/24.
//

import SwiftUI

struct SheetView: View {
    @StateObject private var addressVM = DeliveryAddressViewModel.shared
    @State private var showSheet = false
    var body: some View {
        VStack {
            Text("State")
                .font(.customfont(.semibold, fontSize:15))
                .foregroundStyle(Color.textTitle)
            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            .padding(.top)
            Button{
                showSheet.toggle()
            }label: {
                HStack {
                    Text(addressVM.txtState)
                    Spacer()
                    Image(systemName:"chevron.down")
                }
                .foregroundColor(addressVM.txtState == "Select" ? .gray : .black)
                .font(.customfont(.medium, fontSize: 18))
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius:8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
        .padding(10)
        .sheet(isPresented: $showSheet) {
            OptionSelectionSheet(state: $addressVM.txtState)
        }
    }
}



struct OptionSelectionSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var state: String
    let options = ["Andaman & Nicobar Islands","Andhra Pradesh","Arunachal Pradesh","Assam",
                   "Bihar","Chandigarh","Chhattisgarh","Dadra & Nagar Haveli & Daman & Diu","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu & Kashmir","Jharkhand","Karnataka","Kerala","Ladakh","Lakshadweep","Madhya Pradesh", "Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Pudducherry","Punjab", "Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh", "Uttarakhand","West Bengal"]
    var body: some View {
        NavigationView {
            List(options, id: \.self) { option in
                Button(action: {
                    state = option
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(option)
                        .foregroundStyle(.black)
                        .padding(4)
                }
            }
            .navigationBarTitle("Select a State", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel"){
                presentationMode.wrappedValue.dismiss()
            }).foregroundStyle(.red)
        }
    }
}

#Preview{
    SheetView()
}
