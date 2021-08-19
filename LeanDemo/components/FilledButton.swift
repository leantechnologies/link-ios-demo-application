//
//  FilledButton.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 29/04/2021.
//

import SwiftUI

struct FilledButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
                Text(title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 48, maxHeight: 48)
                    .font(.system(size: 18))
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 2)
                )
        }.padding(.vertical)
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledButton(title: "Button", action: {
            return
        })
    }
}
