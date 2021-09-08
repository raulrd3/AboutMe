//
//  ImageWithLabelStackView.swift
//  AboutMe
//
//  Created by Raul Rodriguez III on 9/6/21.
//

import UIKit

class ImageWithLabelStackView: UIStackView {
    
    // MARK - View Properties
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@raulrdgz"
        return label
    }()
    
    // MARK - Initializer
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
            setUpUI()
        }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - UI Setup
    
    private func setUpUI(){
        setUpImageView()
        setUpTextLabel()
    }
    
    private func setUpImageView() {
        
        axis = .horizontal
        
        addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
        
    }
    
    private func setUpTextLabel(){
        addArrangedSubview(textLabel)
    }
    
    func updateView(image: UIImage, text: String){
        
    }
}
