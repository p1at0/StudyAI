//
//  ScanButton.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

struct ScanButton: UIViewRepresentable {
    @Binding var text: String
    @Binding var title: String
    var isPressed: Bool = false
    
    func vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func makeUIView(context: Context) -> UIButton {
        let textFromCamera = UIAction.captureTextFromCamera(
            responder: context.coordinator,
            identifier: nil)
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "text.viewfinder"),
            for: .normal)
        button.tintColor = UIColor.darkGray

        if isPressed {
            vibrate()
        }
        button.menu = UIMenu(children: [textFromCamera])
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: UIResponder, UIKeyInput {
        let parent: ScanButton
        init(_ parent: ScanButton) { self.parent = parent }
        
        var hasText = false
        func insertText(_ text: String) {
            parent.text = text
            parent.title = "Add \(text)"
        }
        func deleteBackward() { }
    }
}

struct ScanButton_Previews: PreviewProvider {
    static var previews: some View {
        ScanButton(text: .constant(""), title: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
