//
//  ProfileImageAndNameView.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/4/21.
//

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
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let pronounsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        
        backgroundColor = .blue
        
        setUpImageView()
        setUpNameLabel()
        setUpPronounsLabel()
    }
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func setUpNameLabel() {
        
        addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setUpPronounsLabel() {
        
        addSubview(pronounsLabel)
        
        NSLayoutConstraint.activate([
            pronounsLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 5),
            pronounsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pronounsLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
    
    /*
     * 
     */
    func updateView(withImage image: UIImage, fullName: String, pronouns: String) {
        
        imageView.image = image
        fullNameLabel.text = fullName
        pronounsLabel.text = pronouns
    }
}
