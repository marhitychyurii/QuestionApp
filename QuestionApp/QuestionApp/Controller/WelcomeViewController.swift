//
//  ViewController.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 09.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Actions
    @IBAction private func startButtonWasPressed(_ sender: UIButton) {
        guard let gameViewController = storyboard?.instantiateViewController(withIdentifier: "GameVC") as? GameViewController else { return }
        gameViewController.modalPresentationStyle = .fullScreen
        gameViewController.modalTransitionStyle = .partialCurl
        self.present(gameViewController, animated: true, completion: nil)
    }
    
}

