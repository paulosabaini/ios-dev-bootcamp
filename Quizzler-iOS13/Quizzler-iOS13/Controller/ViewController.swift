//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var choice1Button: UIButton!
    @IBOutlet var choice2Button: UIButton!
    @IBOutlet var choice3Button: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.20, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        choice1Button.setTitle(quizBrain.getFirstAnswer(), for: .normal)
        choice2Button.setTitle(quizBrain.getSecondAnswer(), for: .normal)
        choice3Button.setTitle(quizBrain.getThirdAnswer(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
}

