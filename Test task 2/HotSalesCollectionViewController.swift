//
//  HotSalesCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 30.12.22.
//

import UIKit

private let reuseIdentifier = "HotSalesCell"

class HotSalesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellsHotSales: [HomeStore] = []
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        delegate = self
        dataSource = self
        register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: HotSalesCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func set(cellsHotSales: [HomeStore]){
        self.cellsHotSales = cellsHotSales
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsHotSales.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: HotSalesCollectionViewCell.reuseId, for: indexPath) as! HotSalesCollectionViewCell
        //cell.mainImageView.image = cellsHotSales[indexPath.row].mainImage
        //cell.nameLabel.text = cellsHotSales[indexPath.row].itemName
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    

    
