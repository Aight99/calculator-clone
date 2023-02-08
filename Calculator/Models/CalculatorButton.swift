//
//  CalculatorButton.swift
//  Calculator
//
//  Created by ios_developer on 07.02.2023.
//

import UIKit

struct CalculatorButton {
    
    enum ButtonType {
        case number(Int)
        case dot
        case operation
        case action
    }
    
    let buttonType: ButtonType
    let labelText: String
}

extension CalculatorButton {
    
    init(number: Int) {
        self.buttonType = .number(number)
        self.labelText = number.description
    }
    
    var textColor: UIColor {
        switch self.buttonType {
        case .number, .dot, .operation:
            return .white
        case .action:
            return .black
        }
    }
    
    var buttonColor: UIColor {
        switch self.buttonType {
        case .number, .dot:
            return .darkGray
        case .operation:
            return .systemOrange
        case .action:
            return .lightGray
        }
    }
}

