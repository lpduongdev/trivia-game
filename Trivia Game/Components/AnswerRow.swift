//
//  AnswerRow.swift
//  Trivia Game
//
//  Created by Rain on 05/01/2023.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager    
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text).bold()
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                .foregroundColor(answer.isCorrect ?
                                 ColorsConstant.greenColor : ColorsConstant.redColor)
            }
        }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(triviaManager.answerSelected ? (isSelected ? (answer.isCorrect ? ColorsConstant.greenColor: ColorsConstant.redColor) : .gray) : ColorsConstant.globalColor)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: isSelected ? answer.isCorrect ? ColorsConstant.greenColor : ColorsConstant.redColor : .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture {
                if !triviaManager.answerSelected {
                    isSelected = true
                    triviaManager.selectAnswer(answer: answer)
                }
                
            }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Test", isCorrect: true))
            .environmentObject(TriviaManager())
    }
}
