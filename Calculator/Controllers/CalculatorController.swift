//
//  CalculatorController.swift
//  Calculator
//
//  Created by ios_developer on 05.02.2023.
//

import UIKit

class CalculatorController: UIViewController {

    let keyboardSetup: KeyboardSetup
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.reuseID)
        return collection
    }()
    
    init(keyboard: KeyboardSetup = KeyboardSetup.standart) {
        self.keyboardSetup = keyboard
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func setupUI() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}

extension CalculatorController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyboardSetup.keyboard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.reuseID, for: indexPath) as? ButtonCell else {
            fatalError("Dequeue ButtonCell error")
        }
        let button = keyboardSetup.keyboard[indexPath.row]
        cell.configure(button: button)
        return cell
    }
}

extension CalculatorController: UICollectionViewDelegateFlowLayout {
    
    var marginBetweenButtons: CGFloat { return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalMargin = CGFloat(keyboardSetup.buttonsInRow + 1) * marginBetweenButtons
        let buttonWidth = (view.frame.width - totalMargin) / CGFloat(keyboardSetup.buttonsInRow)
        return CGSize(width: buttonWidth, height: buttonWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: marginBetweenButtons,
            left: marginBetweenButtons,
            bottom: marginBetweenButtons,
            right: marginBetweenButtons
        )
    }
}

extension CalculatorController: UICollectionViewDelegate {
    
}


