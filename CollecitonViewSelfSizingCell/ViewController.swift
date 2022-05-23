//
//  ViewController.swift
//  CollecitonViewSelfSizingCell
//
//  Created by Dennis Loskutov on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .null, collectionViewLayout: layout)
        collection.backgroundColor = .orange
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setUpCollectionConstraints()
    }
    
    private func setUpCollectionConstraints() {
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25).isActive = true
        collection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

