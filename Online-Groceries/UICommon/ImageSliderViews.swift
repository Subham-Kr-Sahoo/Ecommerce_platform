//
//  ImageSliderViews.swift
//  Online-Groceries
//
//  Created by Subham  on 24/07/24.
//

import SwiftUI

struct ImageSliderViews: View {
    @State private var currentIndex = 0
    @State private var timer: Timer? = nil
    @State private var isTimerPaused = false
    var slides: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                ZStack(alignment: .trailing) {
                    Image(slides[currentIndex])
                        .resizable()
                        .frame(width: 370, height: 200)
                        .scaledToFit()
                        .cornerRadius(25)
                }
                .padding(.bottom, -15)
                // dot circle hstack
                HStack {
                    
                    Button(action: {
                        goToPrevious()
                        resetTimer()
                    }) {
                        Image(systemName: "arrow.left.circle")
                            .resizable()
                            .frame(width:20+5,height: 20+5)
                            .padding(.horizontal,45)
                            .foregroundStyle(Color(hex: "353935"))
                    }

                    
                    
                    ForEach(0..<slides.count, id: \.self) { index in
                        Circle()
                        .fill(self.currentIndex == index ? Color(hex: "36454F") : Color(hex: "E5E4E2"))
                        .frame(width: self.currentIndex == index ? 12 : 10)
                        .frame(height: self.currentIndex == index ? 12 : 10)
                        .onTapGesture {
                            withAnimation {
                                self.currentIndex = index
                                resetTimer()
                            }
                        }
                    }
                    
                    
                    
                    Button(action: {
                        goToNext()
                        resetTimer()
                    }) {
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .frame(width:20+5,height: 20+5)
                            .padding(.horizontal,45)
                            .foregroundStyle(Color(hex: "353935"))
                    }
                }
                .padding(.vertical,25)
            }
        }
        .padding()
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 4.5, repeats: true) { _ in
            if !isTimerPaused {
                goToNext()
            }
        }
    }

    
    private func resetTimer() {
        isTimerPaused = true
        timer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            isTimerPaused = false
            startTimer()
        }
    }

    private func goToNext() {
        withAnimation {
            if currentIndex + 1 == slides.count {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
    }
    
    private func goToPrevious() {
        withAnimation {
            if currentIndex == 0 {
                currentIndex = slides.count - 1
            } else {
                currentIndex -= 1
            }
        }
    }
}


#Preview {
    ImageSliderViews()
}
