//
//  DetailView.swift
//  AboutMe
//
//  Created by Raul Rodriguez III on 8/31/21.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - View Properties
    
    let profileImageAndNameBackgroundView: ProfileImageAndNameView = {
            let profileImageAndNameView = ProfileImageAndNameView()
            profileImageAndNameView.translatesAutoresizingMaskIntoConstraints = false
            profileImageAndNameView.backgroundColor = .systemGreen
            profileImageAndNameView.layer.cornerRadius = 20
            return profileImageAndNameView
        }()
    
//    let nameLabel: UILabel = {
//       let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "👋 Hey, I'm Raul."
//        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
//        label.textColor = .white
//        return label
//    }()

    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    let locationAndSocials: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "📍 + socials"
        label.textColor = .systemPink
        label.layer.cornerRadius = 20
        return label
    }()

    let hobbies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hobbies go here"
        label.textColor = .green
        label.layer.cornerRadius = 20
        return label
    }()

    let aboutMeInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bold Title About Me + paragraph"
        label.textColor = .orange
        label.layer.cornerRadius = 20
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.layer.cornerRadius = 20
        return stackView
    }()

    // MARK: - Initializer
    
    init(){
        super.init(frame: .zero)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpUI(){
        
        setUpProfileView()
        setUpSubmitButton()
        setUpLabels()
    }
        
    private func setUpProfileView(){

        guard let profileImage = UIImage(named: "raul") else {
            print("Profile Image is nil")
            return
        }
        
        profileImageAndNameBackgroundView.updateView(image: profileImage, fullname: "Raul Rodriguez III", pronouns: "He/Him/His")
        
        addSubview(profileImageAndNameBackgroundView)
        
        NSLayoutConstraint.activate([
            profileImageAndNameBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImageAndNameBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImageAndNameBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImageAndNameBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        ])

    }

    private func setUpSubmitButton() {

        addSubview(submitButton)

        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            submitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1/8)
        ])
    }

    private func setUpLabels() {
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImageAndNameBackgroundView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: profileImageAndNameBackgroundView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: profileImageAndNameBackgroundView.trailingAnchor)
        ])
        
        stackView.addArrangedSubview(locationAndSocials)
        stackView.addArrangedSubview(hobbies)
        stackView.addArrangedSubview(aboutMeInfo)
        
        stackView.backgroundColor = .yellow
        locationAndSocials.backgroundColor = .blue
        hobbies.backgroundColor = .purple
        aboutMeInfo.backgroundColor = .gray
        
    }
    
}
