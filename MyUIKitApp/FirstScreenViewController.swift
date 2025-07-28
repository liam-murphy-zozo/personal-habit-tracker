//
//  ViewController.swift
//  MyUIKitApp
//
//  Created by Liam Murphy on 2025/06/30.
//

import UIKit

class FirstScreenViewController: UIViewController {

    let nextButton  = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupButton()
        title =  "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemRed
        nextButton.configuration?.title = "Next"

        nextButton.translatesAutoresizingMaskIntoConstraints = false // Always need to do for each UI element?

        NSLayoutConstraint.activate([ // can use this to activate a list of contrains instead of individually turning them on.
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        nextButton.addTarget(self, action: #selector(gopToNextScreen), for: .touchUpInside)
    }


    @objc func gopToNextScreen() {
        let nextScreenViewController = SecondScreenViewController()
        nextScreenViewController.title = "Second Screen"
        nextScreenViewController.view.backgroundColor = .systemRed
        navigationController?.pushViewController(nextScreenViewController, animated: true)
    }

}

