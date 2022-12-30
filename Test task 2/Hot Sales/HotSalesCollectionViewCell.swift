//
//  HotSalesCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 30.12.22.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "HotSalesCollectionViewCell"
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFit
        return picture
    }()
    
    let nameTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        title.textColor = #colorLiteral(red: 0.005752829369, green: 0, blue: 0.2077296376, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(picture)
        addSubview(nameTitle)
        
        picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 8/10).isActive = true
        
        // MARK: - дорабоать центрирование текста и цвет текста первой иконки
        nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 65).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}
