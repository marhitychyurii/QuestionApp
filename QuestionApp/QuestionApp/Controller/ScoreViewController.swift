//
//  ScoreViewController.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 10.08.2021.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var correctAnswers = 0
    var wrongAnswers = 0
    
    // MARK: - Outlets
    @IBOutlet weak var numberOfCorrectAnswersLabel: UILabel!
    @IBOutlet weak var numberOfWrongAnswersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCorrectAnswersLabel.text = "\(correctAnswers)"
        numberOfWrongAnswersLabel.text = "\(wrongAnswers)"
    }

    // MARK: - Action
    @IBAction private func restartButtonWasPressed(_ sender: UIButton) {
        guard let welcomeViewController = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeViewController else { return }
        welcomeViewController.modalPresentationStyle = .fullScreen
        welcomeViewController.modalTransitionStyle = .partialCurl
        self.present(welcomeViewController, animated: true, completion: nil)
    }
}
