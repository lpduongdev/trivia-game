//
//  PrimaryButton.swift
//  Trivia Game
//
//  Created by Rain on 05/01/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var backgroud: Color = Color("AccentColor")
    var body: some View {
        Text(text).foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(backgroud)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
