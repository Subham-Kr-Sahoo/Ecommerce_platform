//
//  HomeView.swift
//  Online-Groceries
//
//  Created by Subham  on 23/07/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    HStack(){
                        Image("color_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:25)
                            .padding(.bottom,4)
                        Spacer()
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width:23-3,height:23-3)
                            .padding(.bottom,4)
                            .padding(.trailing,0)
                            .foregroundStyle(Color(hex: "36454F"))
                        Text("Burla, Sambalpur")
                            .font(.customfont(.medium, fontSize:20-4))
                            .foregroundStyle(Color(hex: "36454F"))
                    }
                    .padding(.horizontal,30)
                    SearchTextField(txt: $homeVM.txtSearch)
                        .padding(.horizontal,23)
                        .padding(.bottom,-10)
                    
                    ImageSliderViews()
                    // MARK: Exclusive offer
                    SectionTitleView(title: "Exclusive offer",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    .padding(.vertical,-40)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(0..<5,id:\.self){index in
                                ProductCellView{
                                    
                                }
                            }
                        }.padding(.horizontal,25)
                    }
                    
                    // MARK: Best Selling
                    SectionTitleView(title: "Best Selling",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(0..<5,id:\.self){index in
                                ProductCellView{
                                    
                                }
                            }
                        }.padding(.horizontal,25)
                    }
                    
                    // MARK: Groceries
                    SectionTitleView(title: "Groceries",titleall: "See All"){
                        
                    }.padding(.horizontal,10)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(0..<5,id:\.self){index in
                                CategoryCellView(colour:Color(hex: "F8A44C")){
                                    
                                }
                            }
                        }.padding(.horizontal,25)
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing:10){
                            ForEach(0..<5,id:\.self){index in
                                ProductCellView{
                                    
                                }
                            }
                        }.padding(.horizontal,25)
                    }
                    
                }
                .padding(.top,.topInsets)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
