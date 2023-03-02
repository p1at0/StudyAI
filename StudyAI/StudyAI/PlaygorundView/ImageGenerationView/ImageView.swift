//
//  ImageView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

struct CustomImageView: View {
    var image: UIImage?
    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                    .shadow(color: .black, radius: 8, x: 0, y: 0)
                    .cornerRadius(16)
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 350, height: 350)
                    .cornerRadius(16)
            }
        }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView()
    }
}
