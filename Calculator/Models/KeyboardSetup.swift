//
//  KeyboardSetup.swift
//  Calculator
//
//  Created by ios_developer on 08.02.2023.
//

import Foundation

struct KeyboardSetup {
    let buttonsInRow: Int
    let keyboard: [CalculatorButton]
}

extension KeyboardSetup {
    static let standart: KeyboardSetup = {
        let buttonsInRow = 4
        let keyboard = [
            CalculatorButton(buttonType: .action, labelText: "AC"),
            CalculatorButton(buttonType: .action, labelText: "+/-"),
            CalculatorButton(buttonType: .action, labelText: "%"),
            CalculatorButton(buttonType: .operation, labelText: "÷"),
            CalculatorButton(number: 7),
            CalculatorButton(number: 8),
            CalculatorButton(number: 9),
            CalculatorButton(buttonType: .operation, labelText: "×"),
            CalculatorButton(number: 4),
            CalculatorButton(number: 5),
            CalculatorButton(number: 6),
            CalculatorButton(buttonType: .operation, labelText: "-"),
            CalculatorButton(number: 1),
            CalculatorButton(number: 2),
            CalculatorButton(number: 3),
            CalculatorButton(buttonType: .operation, labelText: "+"),
            CalculatorButton(number: 0),
            CalculatorButton(buttonType: .dot, labelText: "."),
            CalculatorButton(buttonType: .operation, labelText: "="),
        ]
        return KeyboardSetup(buttonsInRow: buttonsInRow, keyboard: keyboard)
    }()
}
