//
//  CustomButton.swift
//  AboutMe
//
//  Created by Raul Rodriguez III on 9/11/21.
//
import UIKit
import Foundation

class CustomButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        backgroundColor = .blue
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        setTitleColor(UIColor(named: "Orange"), for: .normal)
        titleLabel?.font = UIFont(name: "GillSans-Italic", size: 20)
        
    }
    
    func roundCorners (radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func updateButtonTitle (buttonTitle: String){
        setTitle(buttonTitle, for: .normal)
    }
    
}
