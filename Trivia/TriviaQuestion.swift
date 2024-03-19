//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

// Define the Trivia API Response structure
struct TriviaAPIResponse: Decodable {
    let results: [TriviaQuestion]
}

// Define the Trivia Question structure
struct TriviaQuestion: Decodable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
