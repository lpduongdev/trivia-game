//
//  ContentView.swift
//  Trivia Game
//
//  Created by Rain on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40){
                VStack(spacing: 20) {
                    Text("Triva Game")
                        .lilacTitle()
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(.white)
                }
                NavigationLink {
                    TriviaView().environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's Start")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(ColorsConstant.background)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
