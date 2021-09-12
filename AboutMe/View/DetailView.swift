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
        view.backgroundColor = .black
        return view
    }()
    
    let twitterStackView : ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "Twitter")
        imageWithLabelStackView.textLabel.text = "@raulrdgz"
        return imageWithLabelStackView
    }()
    
    let linkedInStackView : ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageWithLabelStackView.imageView.image = UIImage(named: "LinkedIn")
        imageWithLabelStackView.textLabel.text = "linkedin.com/in/raulrd3/"
        return imageWithLabelStackView
    }()

    let interestsView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Cream")
        view.layer.cornerRadius = 20
        return view
    }()
 
    let hobbiesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🤎 Tea, Yoga, & World Languages"
        return label
    }()
    
    let faveFoodLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🍴 Spicy Tofu Curry"
        return label
    }()
    
    let faveShowLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "📺 Star Trek TNG"
        return label
    }()
    
    let iosBioView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Cream")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let iosBioTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I like iOS development because..."
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let iosBioBodyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = """
        I first discovered mobile development through Dart/Flutter.  Then I gave an iOS tutorial a shot and really enjoyed it!  Plus, I've found the iOS community to be quite welcoming!
        """
        return label
    }()
    
    var buttonAction: (() -> Void)?
    
    let submitButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.updateButtonTitle(buttonTitle: "👋 ¡Hola!")
        button.roundCorners(radius: 20)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializer
    
    init(buttonAction: @escaping () -> Void){
        self.buttonAction = buttonAction
        
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
        setUpInterestsView()
        setUpIosBioView()
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
            profileImageAndNameBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3)
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
            twitterStackView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor, constant: 8)
        ])
    }
    
    private func addLinkedInView(){
        addSubview(linkedInStackView)
        
        NSLayoutConstraint.activate([
            linkedInStackView.topAnchor.constraint(equalTo: twitterStackView.bottomAnchor, constant: 8),
            linkedInStackView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor, constant: 8)
        ])
    }
    
    private func setUpInterestsView(){
        
        addSubview(interestsView)
        
        NSLayoutConstraint.activate([
            interestsView.topAnchor.constraint(equalTo: socialsView.bottomAnchor, constant: 20),
            interestsView.leadingAnchor.constraint(equalTo: socialsView.leadingAnchor),
            interestsView.trailingAnchor.constraint(equalTo: socialsView.trailingAnchor),
        ])
        
        addHobbies()
        addFaveFood()
        addFaveShow()
    }
    
    private func addHobbies() {
        
        interestsView.addSubview(hobbiesLabel)
        
        NSLayoutConstraint.activate([
            hobbiesLabel.topAnchor.constraint(equalTo: interestsView.topAnchor, constant: 8),
            hobbiesLabel.leadingAnchor.constraint(equalTo: interestsView.leadingAnchor, constant: 10),
            hobbiesLabel.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor, constant: -10)
        ])
    }
    
    private func addFaveFood(){
        interestsView.addSubview(faveFoodLabel)
        
        NSLayoutConstraint.activate([
            faveFoodLabel.topAnchor.constraint(equalTo: hobbiesLabel.bottomAnchor, constant: 8),
            faveFoodLabel.leadingAnchor.constraint(equalTo: hobbiesLabel.leadingAnchor),
            faveFoodLabel.bottomAnchor.constraint(equalTo: interestsView.bottomAnchor, constant: -10)
        ])
    }
    
    private func addFaveShow(){
        
        faveShowLabel.textAlignment = .right
        
        interestsView.addSubview(faveShowLabel)
        
        NSLayoutConstraint.activate([
            faveShowLabel.topAnchor.constraint(equalTo: faveFoodLabel.topAnchor),
            faveShowLabel.leadingAnchor.constraint(equalTo: faveFoodLabel.trailingAnchor),
            faveShowLabel.bottomAnchor.constraint(equalTo: faveFoodLabel.bottomAnchor),
            faveShowLabel.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpIosBioView() {
        addSubview(iosBioView)
        
        NSLayoutConstraint.activate([
            iosBioView.topAnchor.constraint(equalTo: interestsView.bottomAnchor, constant: 20),
            iosBioView.leadingAnchor.constraint(equalTo: interestsView.leadingAnchor),
            iosBioView.trailingAnchor.constraint(equalTo: interestsView.trailingAnchor),
            iosBioView.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        addIosBioTitle()
        addIosBioBody()
    }
    
    private func addIosBioTitle(){
        
        addSubview(iosBioTitleLabel)
        
        NSLayoutConstraint.activate([
            iosBioTitleLabel.topAnchor.constraint(equalTo: iosBioView.topAnchor, constant: 8),
            iosBioTitleLabel.leadingAnchor.constraint(equalTo: iosBioView.leadingAnchor, constant: 8)
        ])
    }
    
    private func addIosBioBody() {
        
        addSubview(iosBioBodyLabel)
        
        NSLayoutConstraint.activate([
            iosBioBodyLabel.topAnchor.constraint(equalTo: iosBioTitleLabel.bottomAnchor),
            iosBioBodyLabel.leadingAnchor.constraint(equalTo: iosBioTitleLabel.leadingAnchor),
            iosBioBodyLabel.trailingAnchor.constraint(equalTo: iosBioView.trailingAnchor, constant: -4),
            iosBioBodyLabel.bottomAnchor.constraint(equalTo: iosBioView.bottomAnchor, constant: -4)
            
        ])
        
    }
    
    private func setUpSubmitButton() {

        addSubview(submitButton)

        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(greaterThanOrEqualTo: iosBioView.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            submitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonTapped() {
        print("button tapped");
        buttonAction?()
    }
}
