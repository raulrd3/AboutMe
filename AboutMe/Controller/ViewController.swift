//
//  ViewController.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Han")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    let profileImageAndNameView: ProfileImageAndNameView = {
        let profileImageAndNameView = ProfileImageAndNameView()
        profileImageAndNameView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageAndNameView
    }()
    
    let locationWithSocialMediaView: LocationWithSocialMediaView = {
        let locationWithSocialMediaView = LocationWithSocialMediaView()
        locationWithSocialMediaView.translatesAutoresizingMaskIntoConstraints = false
        return locationWithSocialMediaView
    }()
    
    // TODO: Abstract out the views for interests
//    let interestsView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        return view
//    }()
//
//    let hobbiesView: UIView = {
//        let
//    }()
    
    // TODO: Abstract iOS Interest into UIView Subclass
    let iOSInterestView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    let iOSInterestTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "I like iOS Development because..."
        return label
    }()
    
    let iOSInterestDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 8
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = """
        I wanted to give programming a try so I learned some web dev first but after some months, I tried an iOS tutorial, and the rest is history.
        I especially enjoy the helpful communities of iOS Developers, the lucrative opportunity without a degree being a requirement, and being able to create and have thousands or millions of people have what you created in the palm of their hands.
        """
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Say Hi 👋🏻", for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpUI()
    }
    
    private func setUpUI() {
        
        setUpProfileImageAndNameView()
        setUpLocationWithSocialMediaView()
        setUpIOSInterestView()
        setUpButton()
    }

    private func setUpProfileImageAndNameView() {
        
        guard let profileImage = UIImage(named: "Han") else {
            print("Profile image unexpectedly found nil")
            return
        }
        
        profileImageAndNameView.updateView(withImage: profileImage, fullName: "Han Kim", pronouns: "he/him/his")
        
        view.addSubview(profileImageAndNameView)
        
        NSLayoutConstraint.activate([
            profileImageAndNameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageAndNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageAndNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileImageAndNameView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
    }
    
    private func setUpLocationWithSocialMediaView() {
                        
        view.addSubview(locationWithSocialMediaView)
        
        NSLayoutConstraint.activate([
            locationWithSocialMediaView.topAnchor.constraint(equalTo: profileImageAndNameView.bottomAnchor, constant: 20),
            locationWithSocialMediaView.leadingAnchor.constraint(equalTo: profileImageAndNameView.leadingAnchor),
            locationWithSocialMediaView.trailingAnchor.constraint(equalTo: profileImageAndNameView.trailingAnchor),
            locationWithSocialMediaView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setUpIOSInterestView() {
        
        iOSInterestView.addSubview(iOSInterestTitleLabel)
        
        NSLayoutConstraint.activate([
            iOSInterestTitleLabel.topAnchor.constraint(equalTo: iOSInterestView.topAnchor, constant: 10),
            iOSInterestTitleLabel.leadingAnchor.constraint(equalTo: iOSInterestView.leadingAnchor, constant: 10),
            iOSInterestTitleLabel.trailingAnchor.constraint(equalTo: iOSInterestView.trailingAnchor, constant: -10)
        ])
        
        iOSInterestView.addSubview(iOSInterestDescriptionLabel)
        
        NSLayoutConstraint.activate([
            iOSInterestDescriptionLabel.topAnchor.constraint(equalTo: iOSInterestTitleLabel.bottomAnchor, constant: 10),
            iOSInterestDescriptionLabel.leadingAnchor.constraint(equalTo: iOSInterestTitleLabel.leadingAnchor),
            iOSInterestDescriptionLabel.trailingAnchor.constraint(equalTo: iOSInterestView.trailingAnchor, constant: -10),
            iOSInterestDescriptionLabel.bottomAnchor.constraint(equalTo: iOSInterestView.bottomAnchor, constant: -10)
        ])
        
        view.addSubview(iOSInterestView)
        
        NSLayoutConstraint.activate([
            iOSInterestView.topAnchor.constraint(equalTo: locationWithSocialMediaView.bottomAnchor, constant: 20),
            iOSInterestView.leadingAnchor.constraint(equalTo: locationWithSocialMediaView.leadingAnchor),
            iOSInterestView.trailingAnchor.constraint(equalTo: locationWithSocialMediaView.trailingAnchor),
        ])
    }
    
    private func setUpButton() {
        
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: iOSInterestView.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func submitButtonPressed() {
        
        let alertController = UIAlertController(title: nil, message: "Yoo! Nice to meet you!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

