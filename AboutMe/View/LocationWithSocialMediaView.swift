//
//  LocationWithSocialMediaView.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/4/21.
//

import UIKit

class LocationWithSocialMediaView: UIView {
    
    // MARK: - View Properties
    
    let pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let largeFont = UIFont.systemFont(ofSize: 30)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        imageView.image = UIImage(systemName: "mappin.circle.fill", withConfiguration: configuration)
        
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Nashville, TN"
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let twitterView: ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        return imageWithLabelStackView
    }()
    
    let linkedInView: ImageWithLabelStackView = {
        let imageWithLabelStackView = ImageWithLabelStackView()
        imageWithLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        return imageWithLabelStackView
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
        
        backgroundColor = .lightGray
        
        setUpLocationView()
        setUpDivider()
        setUpSocialMediaView()
    }
    
    private func setUpLocationView() {
        
        addSubview(pinImageView)
        
        NSLayoutConstraint.activate([
            pinImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            pinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: pinImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor, constant: 10)
        ])
    }
    
    private func setUpDivider() {
        
        addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: pinImageView.bottomAnchor, constant: 8),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setUpSocialMediaView() {
        
        addSubview(twitterView)
        
        NSLayoutConstraint.activate([
            twitterView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 10),
            twitterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        addSubview(linkedInView)
        
        NSLayoutConstraint.activate([
            linkedInView.topAnchor.constraint(equalTo: twitterView.bottomAnchor, constant: 10),
            linkedInView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            linkedInView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
