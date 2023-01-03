//
//  BestSellerCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 3.01.23.
//

import UIKit

private let reuseIdentifier = "BestSellerCell"

class BestSellerCollectionViewController: UICollectionView, UIColorPickerViewControllerDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var cellsBestSellers = StorageManager.shared.getBestSeller()
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        delegate = self
        dataSource = self
        
        register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: BestSellerCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 10
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsBestSellers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.reuseId, for: indexPath) as! BestSellerCollectionViewCell
        let cellsBestSale = cellsBestSellers[indexPath.row]
        cell.configure(with: cellsBestSale)
        return cell
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


 
