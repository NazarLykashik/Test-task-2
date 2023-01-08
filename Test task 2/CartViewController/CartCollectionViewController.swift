//
//  CartCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 9.01.23.
//

import UIKit

private let reuseIdentifier = "CardCollectionViewCell"

class CartCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    var basket = StorageManager.shared.getBasket()
    
    
    init(){
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseId)
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(basket.count)
        print(basket)
        return basket.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseId, for: indexPath) as! CardCollectionViewCell
        let cells = basket[indexPath.row]
        cell.configure(with: cells)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 222)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

