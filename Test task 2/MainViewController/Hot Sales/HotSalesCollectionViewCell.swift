//
//  HotSalesCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 30.12.22.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "HotSalesCollectionViewCell"
    

    func configure(with hotSales: HomeStore){
        nameTitle.text = hotSales.title
        subTitle.text = hotSales.subtitle
        
        let isBuy = hotSales.is_buy!
        let isNew = hotSales.is_new  ?? false
        
        if isBuy == true {
            isBuyImage.image = UIImage(named: "BuyNow")
        }else{
            return
        }
        
        if isNew == true {
            newMark.image = UIImage(named: "New")
        }else{
            newMark.image = UIImage(named: "IsHiden")
        }
        
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: hotSales.picture!) else {return}
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
    
    let nameTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.init(name: "MarkPro-Bold", size: 20)
        title.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.init(name: "MarkPro", size: 10)
        title.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let newMark: UIImageView = {
        let mark = UIImageView()
        mark.translatesAutoresizingMaskIntoConstraints = false
        mark.contentMode = .scaleAspectFill
        return mark
    }()
    
    let isBuyImage: UIImageView = {
        let isBuy = UIImageView()
        isBuy.image = UIImage(named: "BuyNow")
        isBuy.translatesAutoresizingMaskIntoConstraints = false
        isBuy.contentMode = .scaleAspectFill
        return isBuy
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(picture)
        addSubview(nameTitle)
        addSubview(subTitle)
        addSubview(newMark)
        addSubview(isBuyImage)
        
        picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        picture.layer.cornerRadius = 10
        picture.layer.masksToBounds = true
        
        nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 85).isActive = true
        
        subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: topAnchor, constant: 110).isActive = true
        
        newMark.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        newMark.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        newMark.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        newMark.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/10).isActive = true
        newMark.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/10).isActive = true
        
        isBuyImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        isBuyImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        isBuyImage.topAnchor.constraint(equalTo: topAnchor, constant: 125).isActive = true
        isBuyImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/10).isActive = true
        isBuyImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 5/10).isActive = true
        isBuyImage.layer.cornerRadius = 10
        isBuyImage.layer.masksToBounds = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}
