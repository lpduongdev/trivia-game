//
//  Answer.swift
//  Trivia Game
//
//  Created by Rain on 05/01/2023.
//

import Foundation
struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
