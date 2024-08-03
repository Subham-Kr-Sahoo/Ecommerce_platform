//
//  MarqueeTextView.swift
//  Online-Groceries
//
//  Created by Subham  on 03/08/24.
//

import SwiftUI

struct MarqueeTextView: View {
    @State var text : String = "This is a very long text that i am writing here to show details that it is written by a guy named as someone"
    var textfont : UIFont = UIFont(name:"Gilroy-medium",size:18) ?? .systemFont(ofSize: 18)
    @State var offset : CGFloat = 0
    @State var storedSize : CGSize = .zero
    @Environment(\.colorScheme) var scheme
    var padding : CGFloat = 15
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height:storedSize.height)
                .cornerRadius(10)
            ScrollView(.horizontal,showsIndicators: false){
                Text(text)
                    .font(Font(textfont))
                    .offset(x:offset)
                    .padding(.horizontal,padding)
            }
            .overlay(content: {
                HStack{
                    let colour : Color = scheme == .dark ? .black : .white
                    LinearGradient(colors:[colour.opacity(0.9),colour.opacity(0.7),colour.opacity(0.5),colour.opacity(0.3),colour.opacity(0.1)], startPoint: .leading, endPoint: .trailing)
                        .frame(width:40)
                    Spacer()
                    LinearGradient(colors:[colour.opacity(0.1),colour.opacity(0.3),colour.opacity(0.5),colour.opacity(0.9),colour], startPoint: .leading, endPoint:.trailing )
                        .frame(width:40)
                }
            })
            .disabled(true)
            .onAppear{
                let baseText = text
                text += "                              "
                storedSize = textSize(usingFont: textfont)
                text += baseText
                let timing : Double = 0.015 * storedSize.width
                DispatchQueue.main.asyncAfter(deadline: .now()+0.05){
                    withAnimation(.linear(duration: timing)){
                        offset = -storedSize.width
                    }
                }
            }
            .onReceive(Timer.publish(every: (0.015 * storedSize.width + 0.8), on: .main, in: .default).autoconnect()) { _ in
                offset = 0
                withAnimation(.linear(duration: 0.015 * storedSize.width)){
                    offset = -storedSize.width
                }
        }
        }
    }
    func textSize(usingFont font: UIFont)->CGSize{
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}

#Preview {
    MarqueeTextView()
}
