//
//  DetailView.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/6/21.
//

import UIKit

class DetailView: UIView {

    var buttonAction: (() -> Void)?
    
    let profileImageAndNameView: ProfileImageAndNameView = {
        let profileImageAndNameView = ProfileImageAndNameView()
        profileImageAndNameView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageAndNameView
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "RedColor")
        button.setTitle("Say Hi 👋🏻", for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let socialsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CreamColor")
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "📍 Nashville, TN"
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let twitterStackView: ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "twitter")
        imageWithLabelStackView.imageView.image = imageWithLabelStackView.imageView.image?.withRenderingMode(.alwaysTemplate)
        imageWithLabelStackView.imageView.tintColor = UIColor(named: "NavyColor")
        
        return imageWithLabelStackView
    }()
    
    let linkedInStackView: ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "linkedIn")
        
        imageWithLabelStackView.imageView.image = imageWithLabelStackView.imageView.image?.withRenderingMode(.alwaysTemplate)
        imageWithLabelStackView.imageView.tintColor = UIColor(named: "NavyColor")
        
        imageWithLabelStackView.textLabel.text = "linkedin.com/in/han-kim/b247b891"
        return imageWithLabelStackView
    }()
    
    let interestsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CreamColor")
        return view
    }()
    
    let hobbiesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "❤️ Coffee, plants, hanging out with friends"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let favoriteFoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🍴 Kimchi Jjigae"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let favoriteShowOrMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "📺 The Mandalorian"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let iOSInterestView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CreamColor")
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
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = """
        I wanted to give programming a try so I learned some web dev first but after some months, I tried an iOS tutorial, and the rest is history.
        I especially enjoy the helpful communities of iOS Developers, the lucrative opportunity without a degree being a requirement, and being able to create and have thousands or millions of people have what you created in the palm of their hands.
        """
        return label
    }()
    
    init(buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
                                
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        setUpProfileView()
        setUpSocialsView()
        setUpInterestsView()
        setUpIOSInterestsView()
        setUpButton()
    }
    
    private func setUpProfileView() {
        
        guard let profileImage = UIImage(named: "Han") else {
            print("Profile image unexpectedly found nil")
            return
        }
        
        profileImageAndNameView.updateView(withImage: profileImage, fullName: "Han Kim", pronouns: "he/him/his")
        
        addSubview(profileImageAndNameView)
        
        NSLayoutConstraint.activate([
            profileImageAndNameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageAndNameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            profileImageAndNameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            profileImageAndNameView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3)
        ])
    }
    
    private func setUpSocialsView() {
        
        addSubview(socialsView)
        
        NSLayoutConstraint.activate([
            socialsView.topAnchor.constraint(equalTo: profileImageAndNameView.bottomAnchor, constant: 20),
            socialsView.leadingAnchor.constraint(equalTo: profileImageAndNameView.leadingAnchor),
            socialsView.trailingAnchor.constraint(equalTo: profileImageAndNameView.trailingAnchor),
            socialsView.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        addLocationView()
        addDivider()
        addTwitterView()
        addLinkedInView()
    }
    
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
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func addTwitterView() {
        
        socialsView.addSubview(twitterStackView)
        
        NSLayoutConstraint.activate([
            twitterStackView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 4),
            twitterStackView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor, constant: 20)
        ])
    }
    
    private func addLinkedInView() {
        
        socialsView.addSubview(linkedInStackView)
        
        NSLayoutConstraint.activate([
            linkedInStackView.topAnchor.constraint(equalTo: twitterStackView.bottomAnchor, constant: 4),
            linkedInStackView.leadingAnchor.constraint(equalTo: twitterStackView.leadingAnchor),
            linkedInStackView.bottomAnchor.constraint(equalTo: socialsView.bottomAnchor, constant: -4)
        ])
    }
    
    private func setUpInterestsView() {
        
        addSubview(interestsView)
        
        NSLayoutConstraint.activate([
            interestsView.topAnchor.constraint(equalTo: socialsView.bottomAnchor, constant: 20),
            interestsView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor),
            interestsView.trailingAnchor.constraint(equalTo: socialsView.trailingAnchor)
        ])
        
        addHobbiesLabel()
        addFavoriteFoodLabel()
        addFavoriteShowOrMovieLabel()
    }
    
    private func addHobbiesLabel() {
        
        interestsView.addSubview(hobbiesLabel)
        
        NSLayoutConstraint.activate([
            hobbiesLabel.topAnchor.constraint(equalTo: interestsView.topAnchor, constant: 10),
            hobbiesLabel.leadingAnchor.constraint(equalTo: interestsView.leadingAnchor, constant: 10),
            hobbiesLabel.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor, constant: -10)
        ])
    }
    
    private func addFavoriteFoodLabel() {
    
        interestsView.addSubview(favoriteFoodLabel)
        
        NSLayoutConstraint.activate([
            favoriteFoodLabel.topAnchor.constraint(equalTo: hobbiesLabel.bottomAnchor, constant: 20),
            favoriteFoodLabel.leadingAnchor.constraint(equalTo: hobbiesLabel.leadingAnchor),
            favoriteFoodLabel.bottomAnchor.constraint(equalTo: interestsView.bottomAnchor,constant: -10),
        ])
    }
    
    private func addFavoriteShowOrMovieLabel() {
        
        favoriteShowOrMovieLabel.textAlignment = .right
        
        interestsView.addSubview(favoriteShowOrMovieLabel)
        
        NSLayoutConstraint.activate([
            favoriteShowOrMovieLabel.topAnchor.constraint(equalTo: favoriteFoodLabel.topAnchor),
            favoriteShowOrMovieLabel.leadingAnchor.constraint(equalTo: favoriteFoodLabel.trailingAnchor),
            favoriteShowOrMovieLabel.bottomAnchor.constraint(equalTo: favoriteFoodLabel.bottomAnchor),
            favoriteShowOrMovieLabel.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpIOSInterestsView() {
                
        addSubview(iOSInterestView)
        
        NSLayoutConstraint.activate([
            iOSInterestView.topAnchor.constraint(equalTo: interestsView.bottomAnchor, constant: 20),
            iOSInterestView.leadingAnchor.constraint(equalTo: interestsView.leadingAnchor),
            iOSInterestView.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor),
            iOSInterestView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        addIOSInterestTitle()
        addIOSDescription()
    }
    
    private func addIOSInterestTitle() {
        
        iOSInterestView.addSubview(iOSInterestTitleLabel)
        
        NSLayoutConstraint.activate([
            iOSInterestTitleLabel.topAnchor.constraint(equalTo: iOSInterestView.topAnchor, constant: 4),
            iOSInterestTitleLabel.leadingAnchor.constraint(equalTo: iOSInterestView.leadingAnchor, constant: 8),
            iOSInterestTitleLabel.trailingAnchor.constraint(equalTo: iOSInterestView.trailingAnchor)
        ])
    }
    
    private func addIOSDescription() {
        
        iOSInterestTitleLabel.addSubview(iOSInterestDescriptionLabel)
        
        NSLayoutConstraint.activate([
            iOSInterestDescriptionLabel.topAnchor.constraint(equalTo: iOSInterestTitleLabel.bottomAnchor, constant: 5),
            iOSInterestDescriptionLabel.leadingAnchor.constraint(equalTo: iOSInterestTitleLabel.leadingAnchor),
            iOSInterestDescriptionLabel.trailingAnchor.constraint(equalTo: iOSInterestView.trailingAnchor, constant: -4),
            iOSInterestDescriptionLabel.bottomAnchor.constraint(equalTo: iOSInterestView.bottomAnchor, constant: -4)
        ])
    }
    
    private func setUpButton() {
        
        addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(greaterThanOrEqualTo: iOSInterestView.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            submitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func submitButtonPressed() {
        buttonAction?()
    }
}
