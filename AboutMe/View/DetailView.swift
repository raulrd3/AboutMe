//
//  DetailView.swift
//  AboutMe
//
//  Created by Raul Rodriguez III on 8/31/21.
//

import UIKit

class DetailView: UIView {
    

    let profileImageAndNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false //shortcut 'tamic'
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "👋 Hey, I'm Raul."
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        return label
    }()

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
        return label
    }()

    let hobbies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hobbies go here"
        label.textColor = .green
        return label
    }()

    let aboutMeInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bold Title About Me + paragraph"
        label.textColor = .orange
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


    init(){
        super.init(frame: .zero)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI(){
        profileImageAndNameViewContainer()
        setUpSubmitButton()
        setUpLabels()
    }

    private func profileImageAndNameViewContainer(){

        addSubview(profileImageAndNameView)

        NSLayoutConstraint.activate([
            profileImageAndNameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageAndNameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImageAndNameView.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -20),
            profileImageAndNameView.heightAnchor.constraint(equalToConstant: 200)
        ])

        profileImageAndNameView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: profileImageAndNameView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: profileImageAndNameView.centerYAnchor)
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
            stackView.topAnchor.constraint(equalTo: profileImageAndNameView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: profileImageAndNameView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: profileImageAndNameView.trailingAnchor)
        ])
        
        stackView.addArrangedSubview(locationAndSocials)
        stackView.addArrangedSubview(hobbies)
        stackView.addArrangedSubview(aboutMeInfo)
        
        stackView.backgroundColor = .yellow
        locationAndSocials.backgroundColor = .blue
        hobbies.backgroundColor = .purple
        aboutMeInfo.backgroundColor = .gray
        
        
//        addSubview(labelOne)
//        addSubview(labelTwo)
//        addSubview(labelThree)
//
//        labelOne.backgroundColor = .yellow
//        labelTwo.backgroundColor = .yellow
//        labelThree.backgroundColor = .yellow
//
//        NSLayoutConstraint.activate([
//            labelOne.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 40),
//            labelOne.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
//            labelOne.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
//
//            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 20),
//            labelTwo.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
//            labelTwo.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
//
//            labelThree.topAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: 20),
//            labelThree.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
//            labelThree.trailingAnchor.constraint(equalTo: blueView.trailingAnchor)
//        ])
    }
    
}
