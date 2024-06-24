//
//  GameModel.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 23/06/24.
//

import Foundation

struct GameModel {
    private var score = 0
    
    mutating func checkAnswer(_ userAnswer: String, _ correctAnswer: String) -> Bool {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func setScore(score: Int) {
        self.score = score
    }
}
