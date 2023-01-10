//
//  ProductDetailsCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 6.01.23.
//

import UIKit

class DetailCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{



    var images = StorageManager.shared.getImage()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal


        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        delegate = self
        dataSource = self
        
        register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.reuseId, for: indexPath) as! DetailCollectionViewCell
        
        let cells = images[indexPath.row]
        cell.configure(with: cells)
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

