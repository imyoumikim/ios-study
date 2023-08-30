//
//  ContentView.swift
//  ACard
//
//  Created by 김유미 on 2023/08/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(red: 0.09, green: 0.53, blue: 0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 170)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Youmi Kim")
                    .font(Font.custom("DMSerifDisplay-Italic", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                InfoView(text: "+82 02 1234 1234", imageName: "phone.fill")
                InfoView(text: "youmi@email.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


