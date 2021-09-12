//
//  ViewController.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/1/21.
//

import UIKit

class AboutMeController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func loadView() {
        
        view = DetailView(buttonAction: { [weak self] in
            self?.displayAlert()
        })
    
        view.backgroundColor = .black
    }
    
    // MARK: - Actions
    
    private func displayAlert() {
        
        let alertController = UIAlertController(title: nil, message: "¡Hola Amigx!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Adios", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

