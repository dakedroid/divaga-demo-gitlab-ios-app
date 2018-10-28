//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Kevin Molina on 24/10/18.
//  Copyright © 2018 Kevin Molina. All rights reserved.
//

import UIKit



class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "Divaga", headerTex: "Bienvenido a Divaga", subHeaderText: "Conoce tu ciudad"),
        
        Page(imageName: "mapa", headerTex: "Encuentra los mejores lugares turisticos a la ciudad que visites", subHeaderText: "Recomendaciones turisticas, balnearios, rios, manantiales"),
        
        Page(imageName: "compras", headerTex: "Compra artesanias y productos locales", subHeaderText: "Divaga permite a los productores locales anunciar sus productos y servicios"),
        
        Page(imageName: "hamburgesa", headerTex: "Visita los mejores restaurantes y comercios", subHeaderText: "Cafes, taquerias, restaurantes, bares y vida nocturna")
    ]
    
  
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ANTERIOR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        
        pageControl.currentPage = prevIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SIGUIENTE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.mainColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){

        
        let nextIndex = min (pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControl.currentPage = nextIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainColor
        pc.pageIndicatorTintColor = .gray
        return pc
        
    }()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtomControls()
        
        collectionView.backgroundColor = .white
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
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
   
    
}

