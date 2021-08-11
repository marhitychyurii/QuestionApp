//
//  GameViewController.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 09.08.2021.
//

import UIKit

class GameViewController: UIViewController {
    // Conection to Game Model
    private var game = Game()
    private lazy var question = game.getRandomQuestion()

    // MARK: - Outlets
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var progressTextLabel: UILabel!
    @IBOutlet var answerButtons: [AnswerButtonView]!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set a starting values for views
        updateDataFromModel()
        updateQuestionLabels()
        for index in question.possibleAnswers.indices {
            answerButtons[index].isHidden = false
            answerButtons[index].setTitle(question.possibleAnswers[index], for: .normal)
            answerButtons[index].addTarget(self, action: #selector(answerButtonWasPressed(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Actions
    @IBAction private func nextButtonWasPressed(_ sender: UIButton) {
        updateViewFromModel()
        sender.isHidden = true
        
        if game.isEnded {
            nextButton.removeTarget(self, action: #selector(nextButtonWasPressed(_:)), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(presentScoreViewController(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Methods
    private func updateViewFromModel() {
        for answerButton in answerButtons {
            answerButton.backgroundColor = GameColor.transparent
            answerButton.isHidden = true
            answerButton.isUserInteractionEnabled = true
        }
        
        updateDataFromModel()
        updateQuestionLabels()
        
        for index in question.possibleAnswers.indices {
            answerButtons[index].isHidden = false
            answerButtons[index].setTitle(question.possibleAnswers[index], for: .normal)
        }
        
        if game.currentQuestionNumber == game.numberOfQuestions { nextButton.setTitle("FINISH", for: .normal) }
    }
    
    @objc private func answerButtonWasPressed(_ sender: AnswerButtonView) {
        guard let answerIndex = answerButtons.firstIndex(of: sender) else { return }
        sender.backgroundColor = game.checkTheAnswerToThe(question: question, answerIndex: answerIndex) ? GameColor.correctAns : GameColor.wrongAns
        for button in answerButtons { button.isUserInteractionEnabled = false }
        nextButton.isHidden = false
    }
    
    @objc private func presentScoreViewController(_ sender: UIButton) {
        guard let scoreViewController = storyboard?.instantiateViewController(withIdentifier: "ScoreVC") as? ScoreViewController else { return }
        scoreViewController.modalPresentationStyle = .fullScreen
        scoreViewController.modalTransitionStyle = .partialCurl
        scoreViewController.correctAnswers = game.numberOfCorrectAnswers
        scoreViewController.wrongAnswers = game.numberOfWrongAnswers
        self.present(scoreViewController, animated: true, completion: nil)
    }
    
    private func updateDataFromModel() {
        question = game.getRandomQuestion()
    }
    
    private func updateQuestionLabels() {
        questionTextLabel.text = question.questionText
        progressTextLabel.text = "\(game.currentQuestionNumber) / \(game.numberOfQuestions)"
    }
}
