//
//  SectionTitleView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct SectionTitleView: View {
    @State var title : String = "title"
    @State var titleall : String = "View All"
    var didTap : (()->())?
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundStyle(Color.primaryText)
            
            Spacer()
            
            Text(titleall)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.primaryApp)
        }.padding(.horizontal)
        .frame(height:40)
    }
}

#Preview {
    SectionTitleView()
}
