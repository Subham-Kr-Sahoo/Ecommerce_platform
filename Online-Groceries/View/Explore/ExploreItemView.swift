//
//  ExploreItemView.swift
//  Online-Groceries
//
//  Created by Subham  on 04/08/24.
//

import SwiftUI

struct ExploreItemView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreModel(dict: [:]))
    var columns = [GridItem(.flexible(),spacing:8),GridItem(.flexible(),spacing:8)]
    var body: some View {
        ZStack{
            VStack{
               //MARK: back button and share button
               HStack{
                   Button{
                       mode.wrappedValue.dismiss()
                   }label: {
                       Image("back")
                           .resizable()
                           .scaledToFit()
                           .frame(width:20,height:20)
                   }
                   .padding(.top,50)
                   .padding(.leading,20+10)
                   Text(itemsVM.eiObj.name)
                       .font(.customfont(.bold, fontSize: 32))
                       .padding(.top,.topInsets)
                       .frame(minWidth:0,maxWidth:.screenWidth,alignment: .center)
                   Button{
                       
                   }label: {
                       Image(systemName:"line.3.horizontal.decrease")
                           .resizable()
                           .scaledToFit()
                           .frame(width:20+10,height:20+10)
                           .foregroundStyle(.black)
                   }
                   .padding(.top,50)
                   .padding(.trailing,20+10)
               }
               //MARK: Products lineup
                ScrollView(showsIndicators:false){
                    LazyVGrid(columns:columns,spacing:15){
                        ForEach(itemsVM.listArr,id:\.id){obj in
                            ProductCellView(pObj: obj){
                                
                            }
                        }
                    }
                }.padding(.top,10)
               Spacer()
           }
        }
        .padding(.horizontal)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreItemView(itemsVM: ExploreItemViewModel(catObj:ExploreModel(dict:["cat_id": 1,
                                                          "cat_name": "fruits",
                                                          "image": "http://localhost:3001/img/category/2024070219520252210jAn7vGeGaI2iZzBfzj.png",
                                                                                "color": "F8A446"])))
    }
}
