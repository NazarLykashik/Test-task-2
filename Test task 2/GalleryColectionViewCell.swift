//
//  GalleryCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 29.12.22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
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
        //mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true
        
        // MARK: - дорабоать центрирование текста и цвет текста первой иконки
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}
