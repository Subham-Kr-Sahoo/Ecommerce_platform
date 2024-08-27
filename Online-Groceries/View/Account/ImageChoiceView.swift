//
//  ImageChoiceView.swift
//  Online-Groceries
//
//  Created by Subham  on 27/08/24.
//

import SwiftUI

struct ImageChoiceView: View {
    @AppStorage("selectedImageName") private var selectedImageName: String = "person.fill"
    @AppStorage("selectedBackgroundColor") private var selectedBackgroundColor : String = "D1D0CF"
    @AppStorage("usedName") private var usedName : String = "Human Icon"
    @AppStorage("number") private var number : Int = 1
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
                    .onAppear(perform: {
                        selectedImage = UserImageModel(name: usedName, image: selectedImageName, backgroundColor: selectedBackgroundColor, number: number)
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
                    .onAppear(perform: {
                        selectedImage = UserImageModel(name: usedName, image: selectedImageName, backgroundColor: selectedBackgroundColor, number: number)
                    })
            }
        }
    }
}

struct ImagePickerSheetView : View {
    @AppStorage("selectedImageName") private var selectedImageName: String = "person.fill"
    @AppStorage("selectedBackgroundColor") private var selectedBackgroundColor : String = "D1D0CF"
    @AppStorage("usedName") private var usedName : String = "Human Icon"
    @AppStorage("number") private var number : Int = 1
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
                                    selectedImageName = image.image
                                    selectedBackgroundColor = image.backgroundColor
                                    usedName = image.name
                                    number = image.number
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
                                    selectedImageName = image.image
                                    selectedBackgroundColor = image.backgroundColor
                                    usedName = image.name
                                    number = image.number
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
                selectedImageName = "person.fill"
                selectedBackgroundColor = "D1D0CF"
                usedName = "Human Icon"
                number = 1
                showSheet = false
                selectedImage = userDefaultImage
            })
        }
    }
}


#Preview {
    ImageChoiceView()
}
