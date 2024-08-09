//
//  StepProgressBar.swift
//  Online-Groceries
//
//  Created by Subham  on 08/08/24.
//

import SwiftUI

struct StepProgressBar: View {
    @State var currentStep : Int = 0
    @State var stepNums : Int = 6
    var body: some View {
        VStack(spacing:80){
            StyleOne(stepNums: stepNums, currentStep: $currentStep)
            HStack{
                Button(action: {
                    withAnimation{
                        if currentStep > 0 {
                            currentStep -= 1
                        }
                    }
                }) {
                    Text("Back")
                        .foregroundColor(.black)
                        .font(.customfont(.medium, fontSize: 18))
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius:8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.trailing,8)
                
                Button(action: {
                    withAnimation{
                        if currentStep < 6 {
                            currentStep += 1
                        }
                    }
                }) {
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.customfont(.medium, fontSize: 18))
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius:8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.trailing,8)
            }
        }
    }
}

struct StyleOne : View {
    var stepNums : Int
    @Binding var currentStep : Int
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<stepNums,id:\.self){item in
                Circle().stroke(lineWidth: item<=currentStep ? 15 : 3)
                    .frame(width:30,height: item <= currentStep ? 15 : 30)
                    .foregroundStyle(item < currentStep ? .green : .gray)
                    .overlay {
                        if item < currentStep {
                            Image(systemName: "checkmark")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .transition(.scale)
                        }
                    }
                if item < stepNums-1 {
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(height:3)
                            .foregroundStyle(.gray)
                        Rectangle()
                            .frame(height:3)
                            .frame(maxWidth: item >= currentStep ? 0 : .infinity,alignment: .leading)
                            .foregroundStyle(.green)
                    }
                }
            }
        }
        .frame(height:50)
    }
}

#Preview {
    StepProgressBar()
        .padding(.horizontal,20)
}
