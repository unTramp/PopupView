//
//  SlideUpMenu.swift
//  GradientLayerExample
//
//  Created by Andrey Dorofeev on 14.03.2021.
//

import UIKit

class SlideUpMenuView: UIView {
    
    lazy var slideupMenuShowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()

    lazy var popupMenuLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.gray.cgColor
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.popupMenuLine)
        self.addSubview(self.slideupMenuShowButton)
    }
    
    private func setupConstraints() {
        self.popupMenuLine.translatesAutoresizingMaskIntoConstraints = false
        self.popupMenuLine.heightAnchor.constraint(equalToConstant: 6).isActive = true
        self.popupMenuLine.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.popupMenuLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.popupMenuLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        self.slideupMenuShowButton.translatesAutoresizingMaskIntoConstraints = false
        self.slideupMenuShowButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.slideupMenuShowButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.slideupMenuShowButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.slideupMenuShowButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
}
