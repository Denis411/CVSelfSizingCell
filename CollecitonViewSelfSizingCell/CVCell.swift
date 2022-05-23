//
//  CVCell.swift
//  CollecitonViewSelfSizingCell
//
//  Created by Dennis Loskutov on 23.05.2022.
//

import UIKit

class CVCell: UICollectionViewCell {
    static let identifier = "CVCell"
    
    var label = UILabel()
    var width: CGFloat {  label.bounds.width }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabelConstratins()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func  setUpLabelConstratins() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    public func setLabel(text: String) {
        label.text = text
    }
}
