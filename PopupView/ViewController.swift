//
//  ViewController.swift
//  PopupView
//
//  Created by Andrey Dorofeev on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isBottomMenuPresented = false
    
    lazy var bottomMenuBasicPosition: CGFloat = self.view.frame.height
    
    lazy var slideupMenu: SlideUpMenuView = {
        let view = SlideUpMenuView()
        view.slideupMenuShowButton.addTarget(self, action: #selector(bottomMenuShowButtonTapped), for: .touchUpInside)
       return view
    }()
    
    @objc
    func bottomMenuShowButtonTapped() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.slideupMenu.frame.origin.y = self.bottomChangePosition(self.isBottomMenuPresented)
        } completion: { (finished) in
            print("Animations finished: \(finished)")
            self.isBottomMenuPresented.toggle()
        }
    }
    
    private func bottomChangePosition(_ isUp: Bool) -> CGFloat {
        isUp ? (self.slideupMenu.layer.cornerRadius = 0) : (self.slideupMenu.layer.cornerRadius = 20)
        return isUp ? self.bottomMenuBasicPosition - 80 : self.bottomMenuBasicPosition - self.view.bounds.height / 2.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createGradientLayer()
        self.view.addSubview(slideupMenu)
        self.setupConstraints()
    }

    private func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let firstColor = UIColor(hexString: "#feada6")
        let secondColor = UIColor(hexString: "#f5efef")
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }

    private func setupConstraints() {
        self.slideupMenu.translatesAutoresizingMaskIntoConstraints = false
        self.slideupMenu.heightAnchor.constraint(equalToConstant: self.view.bounds.height / 2.5 + 12).isActive = true
        self.slideupMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.slideupMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        self.slideupMenu.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
}

