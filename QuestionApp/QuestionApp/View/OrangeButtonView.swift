//
//  OrangeButtonView.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 11.08.2021.
//

import UIKit

@IBDesignable
class OrangeButtonView: UIButton {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    private func customizeView() {
        layer.cornerRadius = 15
    }
    
}
