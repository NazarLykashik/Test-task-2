//
//  BestSellerCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 3.01.23.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "HotSalesCollectionViewCell"
    
    
    
    func configure(with bestSellers: BestSeller){
        phoneName.text = bestSellers.title
        price.text = "$\(Int(bestSellers.price_without_discount))"
        old_price.text = "$\(Int(bestSellers.discount_price))"
        

        print(bestSellers)
        
        let favoriteMark = bestSellers.is_favorites!

        //favoriteObjectButton.image = UIImage(named: "LikeUnselected")
        
        if favoriteMark == false {
            favoriteObjectButton.image = UIImage(named: "LikeUnselected")
        }else{
            favoriteObjectButton.image = UIImage(named: "LikeSelected")
        }

        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: old_price.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        old_price.attributedText = attributeString
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: bestSellers.picture!) else {return}
            
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
    
    let phoneName: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        title.textColor = #colorLiteral(red: 0.005752829369, green: 0, blue: 0.2077296376, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let price: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        value.textColor = #colorLiteral(red: 0.005752829369, green: 0, blue: 0.2077296376, alpha: 1)
        value.numberOfLines = 0
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    let old_price: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        value.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        value.numberOfLines = 0
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    var favoriteObjectButton: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(named: "LikeUnselected")
        like.layer.cornerRadius = 16
        like.translatesAutoresizingMaskIntoConstraints = false
        like.contentMode = .scaleAspectFill

        return like
    }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(picture)
            addSubview(phoneName)
            addSubview(price)
            addSubview(old_price)
            addSubview(favoriteObjectButton)
            
            picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
            picture.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            picture.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 7/10).isActive = true
            picture.layer.masksToBounds = true
            
            phoneName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
            phoneName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            phoneName.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
            
            price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
            price.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            price.topAnchor.constraint(equalTo: topAnchor, constant: 175).isActive = true
            
            old_price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75).isActive = true
            old_price.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            old_price.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
            
            favoriteObjectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 135).isActive = true
            //favoriteObjectButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            favoriteObjectButton.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
            favoriteObjectButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
            favoriteObjectButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
            
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}


