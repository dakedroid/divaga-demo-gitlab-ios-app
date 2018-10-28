//
//  ViewController.swift
//  AutoLayout
//
//  Created by Kevin Molina on 22/10/18.
//  Copyright © 2018 Kevin Molina. All rights reserved.
//

import UIKit


extension UIColor {
    
    static var mainColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    
    let bearImageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Divaga"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let titleTextView: UITextView = {
       
        let textView = UITextView()
    
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Bienvenido a Divaga"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    let descriptionTextView: UITextView = {
        
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Conoce tu ciudad"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
        
    }()
    
    
    private let previousButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ANTERIOR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SIGUIENTE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.mainColor, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainColor
        pc.pageIndicatorTintColor = .gray
        return pc
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(bearImageView)
        view.addSubview(titleTextView)
        view.addSubview(descriptionTextView)
    
        setupButtomControls()
        
        setupLayout()
    
    }
    
    fileprivate func setupButtomControls(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    private func setupLayout(){
        
        let topImageContainerView = UIView()
  
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        topImageContainerView.addSubview(bearImageView)
        
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
      
//        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//
        titleTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    

}








