//
//  SpinnerViewController.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/4/21.
//

import UIKit

class SpinnerViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        spinner.color = Constants.backgroundColor
        spinner.startAnimating()
        
        constraints()
    }
    
    public func start(container: UIViewController) {
        container.addChild(self)
        self.view.frame = container.view.frame
        container.view.addSubview(self.view)
        self.didMove(toParent: container)
    }
    
    public func stop() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func constraints() {
        [spinner, spinnerLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            spinnerLabel.topAnchor.constraint(equalTo: spinner.bottomAnchor, constant: 20),
            spinnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    let spinnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.titleBold, size: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.text = Constants.loadingText
        return label
    }()
    
}
