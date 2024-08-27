//
//  WriteReviewView.swift
//  Online-Groceries
//
//  Created by Subham  on 27/08/24.
//

import SwiftUI

struct WriteReviewView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myOrderVM : MyOrderDetailViewModel
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:15){
                    HStack(spacing:15){
                        ForEach(1...5,id: \.self){index in
                            Image(systemName:"star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(index <= myOrderVM.rating ? Color.orange : Color.black.opacity(0.1))
                                .frame(width:.widthPer(per:0.07),height: .heightPer(per:0.07))
                                .onTapGesture {
                                    myOrderVM.rating = index
                                }
                        }
                    }
                    ZStack(alignment:.leading){
                        TextEditor(text: $myOrderVM.txtMessage)
                            .multilineTextAlignment(.leading)
                            .onAppear(){
                                UITextView.appearance().backgroundColor = .clear
                            }
                        VStack{
                            Text(myOrderVM.txtMessage == "" ? "Write a Review here..." : "")
                                .padding(8)
                                .foregroundStyle(Color.placeholder)
                            
                            Spacer()
                        }
                    }
                    .padding(10)
                    .frame(minHeight:300)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(.bottom,10)
                    RoundedButton(title:"Submit"){
                        myOrderVM.serviceCallWriteReview {
                            mode.wrappedValue.dismiss()
                        }
                    }
                }
                .padding()
                .padding(.top,.topInsets+56)
            }
            VStack {
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    Text("Write A Review")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.trailing,20)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2)
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

