//
//  GameModel.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 10.08.2021.
//

import Foundation

class Game {
    
    private(set) var currentQuestionNumber = 0
    private(set) var numberOfCorrectAnswers = 0
    private(set) var numberOfWrongAnswers = 0
    
    var isEnded: Bool {
        currentQuestionNumber == numberOfQuestions
    }
    
    let numberOfQuestions: Int
    
    private var allQuestions = [
        Question(questionText: "Who was the first computer bug?", possibleAnswers: ["Mole", "Cat", "Dog", "Ant"], correctAnswerIndex: 0),
        Question(questionText: "What type of data stores the rows?", possibleAnswers: ["Int", "UInt", "Double", "String"], correctAnswerIndex: 3),
        Question(questionText: "In what year did Apple introduce Swift?", possibleAnswers: ["1988", "2014", "2003", "2010"], correctAnswerIndex: 1),
        Question(questionText: "Which of these people is a co-founder of Apple?", possibleAnswers: ["S.Wozniak", "T.Cook", "E.Musk"], correctAnswerIndex: 0),
        Question(questionText: "what year was founded Apple", possibleAnswers: ["1984", "2000", "1976"], correctAnswerIndex: 2),
    ]
    
    func getRandomQuestion() -> Question {
        currentQuestionNumber += 1
        allQuestions.shuffle()
        return allQuestions.removeFirst()
    }
    
    // This function checks whether the USER has selected
    // the correct answer to the question.
    func checkTheAnswerToThe(question: Question, answerIndex: Int) -> Bool {
        if answerIndex == question.correctAnswerIndex {
            numberOfCorrectAnswers += 1
            return true
        } else {
            numberOfWrongAnswers += 1
            return false
        }
    }
    
    init() {
        self.numberOfQuestions = allQuestions.count
    }
}
