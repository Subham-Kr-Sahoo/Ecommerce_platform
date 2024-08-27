//
//  ImageChoiceView.swift
//  Online-Groceries
//
//  Created by Subham  on 27/08/24.
//

import SwiftUI

struct ImageChoiceView: View {
    let userDefaultImage : UserImageModel = UserImageModel(name: "Human Icon", image: "person.fill", backgroundColor: "D1D0CF", number: 1)
    @State var showSheet : Bool = false
    @State private var selectedImage: UserImageModel = UserImageModel(name: "Human Icon", image: "person.fill", backgroundColor: "D1D0CF", number: 1)
    var body: some View {
        VStack{
            if selectedImage.number == 0 {
                Image(selectedImage.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:60,height:60)
                    .background{
                        Circle()
                            .foregroundStyle(Color(hex: selectedImage.backgroundColor))
                            .frame(width:60,height: 60)
                    }
                    .onTapGesture {
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet, content: {
                        ImagePickerSheetView(showSheet: $showSheet, selectedImage: $selectedImage)
                    })
            }
            else if selectedImage.number == 1 {
                Image(systemName: selectedImage.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:30,height:30)
                    .background {
                        Circle()
                            .foregroundStyle(Color(hex: selectedImage.backgroundColor))
                            .frame(width:60,height: 60)
                    }
                    .onTapGesture {
                        showSheet = true
                    }
                    .sheet(isPresented:$showSheet) {
                        ImagePickerSheetView(showSheet: $showSheet, selectedImage: $selectedImage)
                    }
            }
        }
    }
}

struct ImagePickerSheetView : View {
    @Binding var showSheet : Bool
    @Binding var selectedImage : UserImageModel
    let userDefaultImage : UserImageModel = UserImageModel(name: "Human Icon", image: "person.fill", backgroundColor: "D1D0CF", number: 1)
    let Array : [UserImageModel] = imageArray
    var body: some View {
        NavigationView{
            VStack(spacing:25){
                if selectedImage != userDefaultImage {
                    Text(selectedImage.name)
                        .font(.customfont(.medium, fontSize: 24))
                        .padding()
                }else{
                    Text("Select an Image")
                        .font(.customfont(.medium, fontSize: 24))
                        .padding()
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum:80))], content: {
                    ForEach(Array,id: \.name){ image in
                        if image.number == 0 {
                            VStack {
                                Image(image.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:60,height:60)
                                    .background{
                                        Circle()
                                            .foregroundStyle(Color(hex: image.backgroundColor))
                                            .frame(width:60,height: 60)
                                    }
                                    .onTapGesture {
                                    selectedImage = image
                                }
                                Text(image.name)
                                    .font(.customfont(.medium, fontSize: 16))
                            }
                        }
                        
                    }
                })
                LazyVGrid(columns: [GridItem(.adaptive(minimum:80))], content: {
                    ForEach(Array,id: \.self){ image in
                        if image.number == 1 {
                            VStack {
                                Image(systemName:image.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:30,height:30)
                                    .background{
                                        Circle()
                                            .foregroundStyle(Color(hex: image.backgroundColor))
                                            .frame(width:60,height: 60)
                                    }
                                    .onTapGesture {
                                    selectedImage = image
                                }
                                Text(image.name)
                                    .font(.customfont(.medium, fontSize: 16))
                                    .padding(.top)
                            }
                        }
                        
                    }
                })
                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: Button("Done") {
                showSheet = false
            })
            .navigationBarItems(leading: Button("Clear"){
                showSheet = false
                selectedImage = userDefaultImage
            })
        }
    }
}


#Preview {
    ImageChoiceView()
}
