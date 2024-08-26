//
//  OTPScreenView.swift
//  Online-Groceries
//
//  Created by Subham  on 27/08/24.
//

import SwiftUI

struct OTPScreenView: View {
    @StateObject var forgotVM = ForgotPasswordViewModel.shared;
    var body: some View {
        VStack{
            Text(forgotVM.givenResetCode)
                .font(.customfont(.medium, fontSize: 32))
                .kerning(2)
                .padding(12)
        }
        .background{
            RoundedRectangle(cornerRadius:10)
                .foregroundStyle(.clear)
                .frame(width:.screenWidth)
        }
    }
}

#Preview {
    OTPScreenView()
}
