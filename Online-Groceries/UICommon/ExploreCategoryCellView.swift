//
//  ExploreCategoryCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCellView: View {
    @State var eObj : ExploreModel = ExploreModel(dict: [:])
    var body: some View {
        VStack{
            WebImage(url: URL(string: eObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 90)
            
        
            Spacer()
            Text(eObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding(15)
       .background( eObj.color.opacity(0.3) )
       .cornerRadius(16)
       .overlay (
           RoundedRectangle(cornerRadius: 16)
               .stroke(eObj.color, lineWidth: 1)
       )
    }
}

#Preview {
    ExploreCategoryCellView(eObj: ExploreModel(dict:["cat_id": 1,
                                                      "cat_name": "fruits",
                                                      "image": "http://localhost:3001/img/category/2024070219520252210jAn7vGeGaI2iZzBfzj.png",
                                                      "color": "F8A446"]))
    .padding(20)
}
