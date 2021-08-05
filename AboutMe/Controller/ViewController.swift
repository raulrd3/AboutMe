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
    
//    let headerWithSocialMediaView: HeaderWithSocialMediaView = {
//        let header
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpUI()
    }
    
    private func setUpUI() {
        
        setUpProfileImageAndNameView()
//        setUpLocationAndSocialMediaView()
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
            profileImageAndNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImageAndNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profileImageAndNameView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
    }
}

