//
//  ViewController.swift
//  TestToDoManager
//
//  Created by Alyona Bedrosova on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
           collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
           return collectionView
       }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

