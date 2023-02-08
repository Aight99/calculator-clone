//
//  ButtonCell.swift
//  Calculator
//
//  Created by ios_developer on 07.02.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    static let reuseID = "ButtonCell"
    
    private(set) var calculatorButton: CalculatorButton!
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .regular)
        label.text = "🤡"
        return label
    }()
    
    public func configure(button: CalculatorButton) {
        self.calculatorButton = button
        setupUI()
    }
    
    private func setupUI() {
        addSubview(buttonLabel)
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
        buttonLabel.text = calculatorButton.labelText
        buttonLabel.textColor = calculatorButton.textColor
        buttonLabel.backgroundColor = calculatorButton.buttonColor
        
        let bigButtonLabelOffset = frame.size.width - frame.size.height
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel.widthAnchor.constraint(equalToConstant: frame.size.height),
            buttonLabel.heightAnchor.constraint(equalToConstant: frame.size.height),
            buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -bigButtonLabelOffset),
            buttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
