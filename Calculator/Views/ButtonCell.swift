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
        buttonLabel.text = calculatorButton.labelText
        buttonLabel.textColor = calculatorButton.textColor
        buttonLabel.backgroundColor = calculatorButton.buttonColor
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel.widthAnchor.constraint(equalTo: widthAnchor),
            buttonLabel.heightAnchor.constraint(equalTo: heightAnchor),
            buttonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
