//
//  ProductDetailCollectionViewCell.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 6.01.23.
//


import UIKit

class DetailCollectionViewCell: UICollectionViewCell{
    
    static let reuseId = "DetailCollectionViewCell"
    
    
    
    func configure(with image: String){
        
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: image) else {return}
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: imageData)
            }
        }
    }

        
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(mainImageView)
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainImageView.layer.cornerRadius = 10
        mainImageView.makeShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
