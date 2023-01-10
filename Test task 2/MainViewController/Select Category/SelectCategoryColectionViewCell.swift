//
//  GalleryCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 29.12.22.
//

import UIKit

class SelectCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SelectCategoryCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.layer.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725491405, blue: 0.9725490212, alpha: 1)
        imageView.layer.cornerRadius = 43
        imageView.tintColor = UIColor(red: 0.702, green: 0.702, blue: 0.765, alpha: 1)
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "MarkPro-Bold", size: 14)
        label.textColor = #colorLiteral(red: 0.005752829369, green: 0, blue: 0.2077296376, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label 
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        addSubview(nameLabel)
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true
        
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 85).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}
