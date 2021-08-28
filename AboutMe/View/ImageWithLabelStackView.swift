//
//  ImageWithLabelStackView.swift
//  AboutMe
//
//  Created by Hannie Kim on 8/6/21.
//

import UIKit

class ImageWithLabelStackView: UIStackView {
    
    // MARK: - View Properties
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(named: "NavyColor")        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        label.text = "@heytherehan"
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        
        setUpImageView()
        setUpTextLabel()
    }
    
    private func setUpImageView() {
        
        axis = .horizontal
        distribution = .fill
        spacing = 8
        
        addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func setUpTextLabel() {
        
        addArrangedSubview(textLabel)
    }
    
    /**
     Assigns property values for views
     
     Under MVC, View files are only UI-based. It's up to ViewControllers to determine what data is displayed in these Views.
     */
    func updateView(withImage image: UIImage, andText text: String) {
        
        
    }
}
