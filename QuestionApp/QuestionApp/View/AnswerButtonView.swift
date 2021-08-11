//
//  AnswerButtonView.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 10.08.2021.
//

import UIKit

@IBDesignable
class AnswerButtonView: UIButton {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    private func customizeView() {
        layer.borderWidth = 4
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLabel?.numberOfLines = 1
        titleLabel?.adjustsFontSizeToFitWidth = true
    }

}
