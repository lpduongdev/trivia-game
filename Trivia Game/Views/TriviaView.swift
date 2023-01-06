//
//  TriviaView.swift
//  Trivia Game
//
//  Created by Rain on 06/01/2023.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Spacer()
                Text("Trivia Game")
                    .lilacTitle()
                Text("Congratulations, you completed the game! <3")
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                Spacer()
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Try again")
                }
                
            }.foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(ColorsConstant.background)
                .navigationBarBackButtonHidden(true)
        } else {
            QuestionView().environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
