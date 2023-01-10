//
//  CardCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 8.01.23.
//

import UIKit



class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var delete: UIButton!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    static let reuseId = "CardCollectionViewCell"
    

    
    var basket = StorageManager.shared.getBasket()
    
    func configure(with basket: Basket){
        titleLabel.text = basket.title
        priceLabel.text = "$ \(Int(basket.price ?? 0))"
        titleLabel.font = UIFont.init(name: "MarkPro", size: 17)
        priceLabel.font = UIFont.init(name: "MarkPro", size: 17)
        countLabel.font = UIFont.init(name: "MarkPro", size: 17)
        

        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: basket.images!) else {return}
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}

            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
}
