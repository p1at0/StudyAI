//
//  MainPlaygroundView.swift
//  StudyAI
//
//  Created by Abdulla on 12.02.2023.
//

import SwiftUI

struct PlaygroundView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Cards()
            }
        }
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}
