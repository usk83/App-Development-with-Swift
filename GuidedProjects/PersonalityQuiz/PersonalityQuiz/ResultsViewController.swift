//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Yusuke on 2020/04/27.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }

    func calculatePersonalityResult() {
        let responseTypes = responses.map { $0.type }
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        for response in responseTypes {
            let newCount: Int

            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }

            frequencyOfAnswers[response] = newCount
        }

        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
            $1.1 }.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
