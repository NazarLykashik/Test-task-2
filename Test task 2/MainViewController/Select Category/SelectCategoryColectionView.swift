//
//  CollectionViewCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 29.12.22.
//

import UIKit


class SelectCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cells: [SelectCategoryModel] = []
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)
        delegate = self
        dataSource = self
        register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: SelectCategoryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func set(cells: [SelectCategoryModel]){
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SelectCategoryCollectionViewCell.reuseId, for: indexPath) as! SelectCategoryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = cells[indexPath.row].itemName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
