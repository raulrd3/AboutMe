//
//  AboutMeViewController.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/1/21.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    override func loadView() {
        
        view = DetailView(buttonAction: { [weak self] in
            self?.submitButtonPressed()
        })
        
        view.backgroundColor = .white
    }
    
    private func submitButtonPressed() {
        
        let alertController = UIAlertController(title: nil, message: "Yoo! Nice to meet you!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

