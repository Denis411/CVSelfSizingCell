//
//  ViewController.swift
//  CollecitonViewSelfSizingCell
//
//  Created by Dennis Loskutov on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {
    let arrayOfTitles = ["one", "two", "three", "a very long title for the cell", "0", "some", "cat", "xcode",
                         "one", "two", "three", "a very long title for the cell", "0", "some", "cat", "xcode",
                         "one", "two", "three", "a very long title for the cell", "0", "some", "cat", "xcode",
                         "one", "two", "three", "a very long title for the cell", "0", "some", "cat", "xcode",
                         "one", "two", "three", "a very long title for the cell", "0", "some", "cat", "xcode"]
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .null, collectionViewLayout: layout)
        collection.backgroundColor = .orange
        collection.register(CVCell.self, forCellWithReuseIdentifier: CVCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setUpCollectionConstraints()
        setUPCollectionView()
    }
    
    private func setUpCollectionConstraints() {
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 60).isActive = true
        collection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setUPCollectionView() {
        collection.delegate = self
        collection.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCell.identifier, for: indexPath) as! CVCell
        cell.backgroundColor = .black
        cell.setLabel(text: arrayOfTitles[indexPath.item])
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = arrayOfTitles[indexPath.item]
        let font = UIFont.systemFont(ofSize: 20)
        
        let width = string.size(withAttributes: [NSAttributedString.Key.font: font]).width
        
        return CGSize(width: width, height: 50)
    }
}
