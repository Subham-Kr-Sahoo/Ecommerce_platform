//
//  LineTextField.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI

struct LineTextField: View {
    @State var title : String = "Title"
    @State var placeholder : String = "PlaceHolder"
    @Binding var txt : String
    @State var keyboardType : UIKeyboardType = .default
    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.semibold, fontSize:15))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            
                TextField(placeholder,text: $txt)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 40)
            }
        Divider()
    }
}


struct LineSecureField: View {
    @Binding var txt : String
    @Binding var isShowPassword : Bool 
    @State var title : String = "Title"
    @State var placeholder : String = "PlaceHolder"

    
    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.semibold, fontSize:15))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            
            if isShowPassword {
                TextField(placeholder,text: $txt)
                    .autocorrectionDisabled()
                    .modifier(showButton(isShow: $isShowPassword))
                    .frame(height: 40)
            }else{
                SecureField(placeholder,text: $txt)
                    .modifier(showButton(isShow: $isShowPassword))
                    .frame(height: 40)
            }
            
        Divider()
        }
    }
}


struct LineTextField_Previews : PreviewProvider {
    @State static var txt1 : String = ""
    @State static var pass : Bool = true
    static var previews: some View{
        LineTextField(txt: $txt1)
            .padding(20)
    }
}




