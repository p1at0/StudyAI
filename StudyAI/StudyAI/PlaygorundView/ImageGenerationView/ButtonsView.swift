//
//  ButtonsView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

//MARK: Button Style

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .font(Font.custom("Carlito Bold", size: 17))
            .foregroundColor(.black)
            .background(Color.background)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring())
    }
}

//MARK: Clear Button

struct ClearTextField: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .padding(.trailing, text.isEmpty ? 0 : 30)
            }
            .padding(.trailing, -10)
            .foregroundColor(.background)
            .offset(x: -10, y: 0)
            .opacity(text.isEmpty ? 0 : 1)
            .animation(.interactiveSpring())
                            
        }
    }
}
