//
//  ViewController.swift
//  ApplePie
//
//  Created by Yusuke on 2020/04/23.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentGame: Game!
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var score = 0

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateUI() {
//        var letters = [String]()
//        for letter in currentGame.formattedWord.characters {
//            letters.append(String(letter))
//        }
//        let wordWithSpacing = letters.joined(separator: " ")
//        correctWordLabel.text = wordWithSpacing
        correctWordLabel.text = currentGame.formattedWord.characters.map { String($0) }.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses), Score: \(score)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }

    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }

    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            score += 10
            totalWins += 1
        } else {
            updateUI()
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        if currentGame.playerGuessed(letter: letter) {
            score += 1
        }
        updateGameState()
    }
}
