//
//  QuestionView.swift
//  Trivia Game
//
//  Created by Rain on 05/01/2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            HStack {
            
                Text("Trivia Game")
                    .lilacTitle()
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {

                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                Spacer()

                ForEach(triviaManager.answerChoices, id: \.id) {
                    answer in AnswerRow(answer: answer).environmentObject(triviaManager)
                }

                Spacer()

                
            }
            
            Spacer()
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next question", backgroud: triviaManager.answerSelected ? ColorsConstant.globalColor: .gray).padding()
            }.disabled(!triviaManager.answerSelected)
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(ColorsConstant.background)
        .navigationBarBackButtonHidden(true)
    }
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView().environmentObject(TriviaManager())
        }
    }
}
