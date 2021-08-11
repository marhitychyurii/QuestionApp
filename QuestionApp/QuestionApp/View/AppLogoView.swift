//
//  AppLogoView.swift
//  QuestionApp
//
//  Created by Юра Маргітич on 09.08.2021.
//

import UIKit

@IBDesignable
class AppLogoView: UILabel {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }

    private func customizeView() {
        layer.cornerRadius = 20
    }

}
