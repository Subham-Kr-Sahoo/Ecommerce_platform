//
//  CategoryCellView.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCellView: View {
    @State var tObj : TypeModel = TypeModel(dict: [ : ])
    var didAddCart : (()->())?
    var body: some View {
        
        HStack{
            WebImage(url: URL(string:tObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width:70,height:70)
            
            Text(tObj.type_name)
                .font(.customfont(.semibold, fontSize: 26))
                .foregroundStyle(Color(hex: "343434"))
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                .padding(.leading,20)
        }.padding(15)
            .frame(width:250,height: 100)
            .background(tObj.color.opacity(0.5))
            .cornerRadius(20)
    }
}

#Preview {
    CategoryCellView(tObj: TypeModel(dict:["type_id": 1,
                                           "type_name": "BarbarianKing",
                                           "image": "http://localhost:3001/img/type/2024070220415941595EZCsBPParQ6ak2ytuXM.png",
                                           "color":"F8A446"]))
}
