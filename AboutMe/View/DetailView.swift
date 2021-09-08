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

    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    let socialsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Cream")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "📍 Houston, Texas"
        return label
    }()
    
    let divider : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let twitterStackView : ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "Twitter")
        imageWithLabelStackView.textLabel.text = " @raulrdgz"
        return imageWithLabelStackView
    }()
    
    let linkedInStackView : ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "LinkedIn")
        imageWithLabelStackView.textLabel.text = " linkedin.com/in/raulrd3/"
        return imageWithLabelStackView
    }()

    //TODO:  Add interestsView UIView
    //TODO:  Add hobbiesLabel UILabel
    //TODO:  Add faveFoodLabel UILabel
    //TODO:  Add faveShowLabel UILabel
    

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
        setUpSocialsView()
        // TODO: setUpInterestsView()
        setUpSubmitButton()
        
    }
        
    private func setUpProfileView(){

        guard let profileImage = UIImage(named: "Raul") else {
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

    private func setUpSocialsView() {
        
        addSubview(socialsView)
        
        NSLayoutConstraint.activate([
            socialsView.topAnchor.constraint(equalTo: profileImageAndNameBackgroundView.bottomAnchor, constant: 20),
            socialsView.leadingAnchor.constraint(equalTo: profileImageAndNameBackgroundView.leadingAnchor),
            socialsView.trailingAnchor.constraint(equalTo: profileImageAndNameBackgroundView.trailingAnchor),
            socialsView.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        addLocationView()
        addDivider()
        addTwitterView()
        addLinkedInView()

        
    }
    
    //TODO: addLocation()
    private func addLocationView() {
        
        socialsView.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: socialsView.topAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor, constant: 10)
        ])
    }
    
    private func addDivider() {
        
        socialsView.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            divider.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: socialsView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    private func addTwitterView(){
        addSubview(twitterStackView)
        
        NSLayoutConstraint.activate([
            twitterStackView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 8),
            twitterStackView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor)
        ])
    }
    
    private func addLinkedInView(){
        addSubview(linkedInStackView)
        
        NSLayoutConstraint.activate([
            linkedInStackView.topAnchor.constraint(equalTo: twitterStackView.bottomAnchor, constant: 8),
            linkedInStackView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor)
        ])
    }
    
    // TODO: private func setUpInterestsView(){}
    
    private func setUpSubmitButton() {

        addSubview(submitButton)

        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            submitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1/8)
        ])
    }
}
