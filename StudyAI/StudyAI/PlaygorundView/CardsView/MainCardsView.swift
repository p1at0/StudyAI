//
//  MainCardsView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

struct Cards: View {
    @State var cardOneShow = false
    @State var cardOneSiteButtonShow = false
    @State var cardTwoShow = false
    @State var cardTwoSiteButtonShow = false
    
    var body: some View {
        VStack() {
            Text("ChatGPT")
                .foregroundColor(.background)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.top, cardOneShow ? 30 : 20)
                .padding(.bottom, cardOneShow ? 20 : 0)
            
            Text("ChatBot based on a neural network developed by OpenAI. It can carry on a conversation with the user and provide relevant information upon request.")
                .foregroundColor(.background)
                .font(.headline)
                .multilineTextAlignment(.center)
                .animation(.spring())
                .cornerRadius(0)
                .lineLimit(.none)
            
            Spacer()
            
            Button(action: {
                self.cardOneShow.toggle()
                self.cardOneSiteButtonShow = !self.cardOneSiteButtonShow
                self.cardTwoShow = false
                self.cardTwoSiteButtonShow = false
                let vibration = UINotificationFeedbackGenerator()
                vibration.notificationOccurred(.success)
            }) {
                HStack {
                    Image(systemName: cardOneShow ? "slash.circle.fill" : "slash.circle")
                        .foregroundColor(Color("vanguard"))
                        .font(Font.title.weight(.semibold))
                        .imageScale(.small)
                    Text(cardOneShow ? "Close" : "Open Card")
                        .foregroundColor(Color("vanguard"))
                        .fontWeight(.medium)
                        .font(.title)
                        .cornerRadius(0)
                }
            }
            .padding(.bottom, cardOneShow ? 15 : 10)
            
            if cardOneSiteButtonShow {
                NavigationLink(destination: HomeView(viewModel: ViewModel())) {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color.background)
                            .font(Font.title.weight(.semibold))
                            .imageScale(.small)
                        Text("Start")
                            .foregroundColor(Color.background)
                            .fontWeight(.medium)
                            .font(.title)
                            .cornerRadius(0)
                    }
                }
            }
        }
        .padding()
        .padding(.top, 15)
        .frame(width: cardOneShow ? 300 : 240, height: cardOneShow ? 370 : 210)
        .animation(.spring())
        
        VStack() {
            Text("DALLE-2")
                .foregroundColor(.background)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.top, cardTwoShow ? 30 : 20)
                .padding(.bottom, cardTwoShow ? 20 : 0)
            Text("Can combine concepts, attributes and styles and generate original and accurate images.")
                .foregroundColor(.background)
                .font(.headline)
                .multilineTextAlignment(.center)
                .animation(.spring())
                .cornerRadius(0)
                .lineLimit(.none)
            
            Spacer()
            
            Button(action: {
                self.cardTwoShow.toggle()
                self.cardTwoSiteButtonShow = !self.cardTwoSiteButtonShow
                self.cardOneShow = false
                self.cardOneSiteButtonShow = false
                let vibration = UINotificationFeedbackGenerator()
                vibration.notificationOccurred(.success)
            }) {
                HStack {
                    Image(systemName: cardTwoShow ? "slash.circle.fill" : "slash.circle")
                        .foregroundColor(Color("vanguard"))
                        .font(Font.title.weight(.semibold))
                        .imageScale(.small)
                    Text(cardTwoShow ? "Close" : "Open Card")
                        .foregroundColor(Color("vanguard"))
                        .fontWeight(.medium)
                        .font(.title)
                        .cornerRadius(0)
                }
            }
            .padding(.bottom, cardTwoShow ? 15 : 10)
            
            if cardTwoSiteButtonShow {
                NavigationLink(destination: GenerateImageView()) {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color.background)
                            .font(Font.title.weight(.semibold))
                            .imageScale(.small)
                        Text("Start")
                            .foregroundColor(Color.background)
                            .fontWeight(.medium)
                            .font(.title)
                            .cornerRadius(0)
                    }
                }
            }
            
        }
        .padding()
        .padding(.top, 15)
        .frame(width: cardTwoShow ? 300 : 240, height: cardTwoShow ? 370 : 210)
        .animation(.spring())
    }
}

#if DEBUG
struct Cards_Previews : PreviewProvider {
    static var previews: some View {
        Cards()
    }
}
#endif



