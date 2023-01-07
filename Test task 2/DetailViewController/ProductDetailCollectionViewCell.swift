//
//  ProductDetailCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 6.01.23.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ProductDetailsCollectionViewCell"
    
    
    
    func configure(with picture: ProductDetails){
        

        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: picture.images![0]) else {return}
            
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
            
            DispatchQueue.main.async {
                self.picture.image = UIImage(data: imageData)
            }
        }
    }
        
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    

        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(picture)

            
            picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
            picture.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            picture.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 7/10).isActive = true
            picture.layer.masksToBounds = true  
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}


