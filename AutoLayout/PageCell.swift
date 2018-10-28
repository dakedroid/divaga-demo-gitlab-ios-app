//
//  PageCell.swift
//  AutoLayout
//
//  Created by Kevin Molina on 24/10/18.
//  Copyright © 2018 Kevin Molina. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    var page: Page? {
        
        didSet{
            
            guard let unwrappedPage = page else {return}
            
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            titleTextView.text = unwrappedPage.headerTex
            descriptionTextView.text = unwrappedPage.subHeaderText 

        }
    }
    
    private let bearImageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "compras"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleTextView: UITextView = {
        
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Bienvenido a Divaga"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    private let descriptionTextView: UITextView = {
        
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Conoce tu ciudad"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    

    private func setupLayout(){
        
        let topImageContainerView = UIView()

        
        addSubview(topImageContainerView)
        addSubview(titleTextView)
        addSubview(descriptionTextView)
        
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.backgroundColor = .white
        
        topImageContainerView.addSubview(bearImageView)
        
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
      
        
        titleTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

        
        descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

