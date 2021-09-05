//
//  ProfileImageAndNameView.swift
//  AboutMe
//
//  Created by Raul Rodriguez III on 9/2/21.
//

//import Foundation

import UIKit

class ProfileImageAndNameView: UIView {
    
    // MARK: - View Properties
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let pronounsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initializer
    
    
    // https://stackoverflow.com/questions/35496962/override-init-method-of-uiview-in-swift
    // no idea how this works ^^
    
    override init(frame: CGRect) {
            super.init(frame: frame)

            setUpUI()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        
        setUpImageView()
        setUpNameLabel()
        setUpPronounsLabel()
    }
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        // TODO: Add Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func setUpNameLabel() {
        
        addSubview(nameLabel)
        
        // TODO: Add Constraints
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setUpPronounsLabel() {
        
        addSubview(pronounsLabel)
        
        // TODO: Add Constraints
        NSLayoutConstraint.activate([
            pronounsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            pronounsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pronounsLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
    
    func updateView(image: UIImage, fullname: String, pronouns: String) {
        
        imageView.image = image
        nameLabel.text = fullname
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        pronounsLabel.text = pronouns
        pronounsLabel.textColor = .white
        pronounsLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
    }
}



