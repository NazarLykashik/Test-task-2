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
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        title.textColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(picture)
        addSubview(nameTitle)
        addSubview(subTitle)
        
        picture.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 95).isActive = true
        
        subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implamented")
    }
}
