//
//  MainGenerationView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI
import OpenAIKit
import Photos

// MARK: User Interface

struct GenerateImageView: View {
    
    @ObservedObject var viewModel = GenerateViewModel()
    @State var text = ""
    @State var image: UIImage?
    @State var isLoading = false
    @State private var bottomPadding: CGFloat = 0
    @State private var isTextFieldActive = false
    @State var textField: UITextField = UITextField()
    @State var showAlertX: Bool = false
    @State var isPreviewing = false
    @State private var showAlert = false
    @State var imageSaved = false

    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Shine here...", text: $text).padding(7)
                        .animation(.easeOut)
                        .padding(12)
                        .padding(.horizontal, 20)
                        .font(.system(size: 18, weight: .medium))
                    ClearTextField(text: $text)
                }
                Spacer()
                if isLoading {
                    Spinner()
                } else if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 350)
                            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5))
                            .transition(.scale)
                            .shadow(color: .black, radius: 8, x: 0, y: 0)
                            .cornerRadius(16)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    // toggle the preview state
                                    self.isPreviewing.toggle()
                                }
                            }
                            .blurredSheet(.init(.ultraThinMaterial), show: $isPreviewing) {
                                
                            } content: {
                                GeometryReader { geometry in
                                    VStack(alignment: .center) {
                                        Spacer()
                                        Image(uiImage: self.image!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                if let image = self.image {
                                                    self.saveToCameraRoll(image: image)
                                                }
                                            }) {
                                                Image(systemName: "photo.circle.fill")
                                                    .foregroundColor(.black)
                                            }
                                            .alert(isPresented: $showAlert) {
                                                    Alert(
                                                        title: Text("Successfully!"),
                                                        message: Text("Image saved in your camera roll.")
                                                    )
                                                    
                                                }
                                            .padding(15)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                            Spacer()
                                        }
                                    }
                                }
                            }.animation(.spring())
                }
                else {
                    if !isTextFieldActive {
                        Text("Realize your fantasy with AI")
                            .foregroundColor(Color.background)
                            .font(.custom("Carlito Bold", size: 20))

                    }
                }
                Spacer()
                Button("Generate") {
                    if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred()
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.isLoading = true
                        Task {
                            let result = await viewModel.generateImage(prompt: text)
                            if result == nil {
                                showAlert = true
                            }
                            self.image = result
                            self.isLoading = false
                        }
                    }
                }
                .animation(.easeOut)
                .cornerRadius(20)
                .shadow(color: Color.black, radius: 5, y: 5)
                .buttonStyle(PrimaryButtonStyle())
                .padding()
                .offset(x: 0, y: bottomPadding)
                .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error :("),
                            message: Text("Most likely you are using a forbidden word, or your Internet connection is not stable.")
                        )
                        
                    }
                
            }
            
            .padding(.bottom, bottomPadding) //Add padding at the bottom of the outermost VStack
            .onAppear {
                viewModel.setup()
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                    let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    self.bottomPadding = -keyboardFrame.height
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    self.bottomPadding = 0
                }
            }
        }
    }
    
    func vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    func saveToCameraRoll(image: UIImage) {
        // Save image to the camera roll
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }) { (success, error) in
            self.showAlert = true
        }
    }


}

struct GenerateImageView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateImageView()
    }
}

