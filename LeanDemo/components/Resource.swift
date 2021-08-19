//
//  Resource.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 18/08/2021.
//

import SwiftUI

struct Resource: View {
    let title: String
    let image: String
    let link: String
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height:150)
                .clipped()
                .cornerRadius(12.0)
            Text(title)
                .font(.caption)
        }
        .gesture(
            TapGesture()
                .onEnded({ _ in
                    if let url = URL(string: link) {
                        UIApplication.shared.open(url)
                    }
                })
        )
    }
}

struct Resource_Previews: PreviewProvider {
    static var previews: some View {
        Resource(title: "Use the Swift SDK", image: "github", link: "https://www.leantech.me")
    }
}
