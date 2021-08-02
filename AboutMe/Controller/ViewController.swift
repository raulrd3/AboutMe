//
//  ViewController.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/1/21.
//

import UIKit

class ViewController: UIViewController {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Han Kim"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .blue
        label.backgroundColor = .yellow
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Han")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    let favoriteFoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorite Food"
        return label
    }()
    
    let myFavoriteFoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kimchi Jjigae"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpUI()
    }
    
    private func setUpUI() {
        
        setUpNameLabel()
        setUpImageView()
    }
    
    private func setUpNameLabel() {
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpImageView() {
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setUpFavoriteFoodSection() {
        
        // favorite foods with no stack view
    }
    
    private func setUpLocationSection() {
        
        // show how to use stack view 
    }
}

