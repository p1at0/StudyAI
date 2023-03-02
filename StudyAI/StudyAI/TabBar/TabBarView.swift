//
//  ContentView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
            PlaygroundView()
                .tabItem {
                    Image(systemName: "poweroutlet.type.f.fill")
                    Text("Playground")
                }
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                    Text("Settings")
                }
        }
        .accentColor(Color("vanguard"))
        .foregroundColor(.white)
        .environment(\.colorScheme, .dark)
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarView()
    }
}






