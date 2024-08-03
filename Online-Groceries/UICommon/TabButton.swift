//
//  TabButton.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct TabButton: View {
    @State var title : String = "Title"
    @State var icon : String = "magnifyingglass"
    var isSelect : Bool = false
    var didSelect : (()->())
    var body: some View {
        Button{
            didSelect()
        }label: {
            VStack{
                Image(systemName:icon)
                    .resizable()
                    .frame(width:25,height:25)
                    
                Text(title)
                    .font(.customfont(.semibold, fontSize:20-5))
            }
        }.foregroundColor(isSelect ? .primaryApp : Color(hex:"5A5A5A"))
            .frame(minWidth: 0,maxWidth: .infinity)
    }
}

#Preview {
    TabButton{
        print("Test")
    }
}
