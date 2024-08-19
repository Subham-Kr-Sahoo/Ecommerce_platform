//
//  NotificationView.swift
//  Online-Groceries
//
//  Created by Subham  on 19/08/24.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var notiVM = NotificationViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(notiVM.listArr,id:\.id){nObj in
                        NotificationRowView(nObj: nObj)
                    }
                }
            }
            .padding(.horizontal,10)
            .padding(.top,.topInsets+56)
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
                    Text("Notifications")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.leading,40)
                    Spacer()
                    Button{
                        notiVM.serviceCallReadAll()
                    }label: {
                        Text("Read All")
                            .font(.customfont(.medium, fontSize:15))
                            .foregroundStyle(Color.primaryApp)
                    }
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),radius:2)
                Spacer()
                
            }
        }
        .alert(isPresented: $notiVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(notiVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NotificationView()
}
