//
//  Game.swift
//  ApplePie
//
//  Created by Yusuke on 2020/04/23.
//  Copyright © 2020年 usk83. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    mutating func playerGuessed(letter: Character) -> Bool {
        guessedLetters.append(letter)
        if !word.contains(String(letter)) {
            incorrectMovesRemaining -= 1
            return false
        }
        return true
    }
}
