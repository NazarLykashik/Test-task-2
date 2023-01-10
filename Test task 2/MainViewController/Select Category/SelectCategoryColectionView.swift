//
//  CollectionViewCollectionViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 29.12.22.
//

import UIKit


class SelectCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    var cells: [SelectCategoryItem] = []
    var selectedIndex: IndexPath?
    var handleChangeCategory: ((_: Category) -> Void)? = nil
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
    
    func set(cells: [SelectCategoryItem]){
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SelectCategoryCollectionViewCell.reuseId, for: indexPath) as!
            SelectCategoryCollectionViewCell
        if self.selectedIndex == nil {
            self.selectedIndex = indexPath
        }
        if indexPath == self.selectedIndex  {
            cell.mainImageView.image = cells[indexPath.row].item.mainImage
            cell.mainImageView.backgroundColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
            cell.mainImageView.tintColor = #colorLiteral(red: 0.9725490212, green: 0.9725491405, blue: 0.9725490212, alpha: 1)
            cell.nameLabel.textColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
            cell.nameLabel.text = cells[indexPath.row].item.itemName
        } else {
            cell.mainImageView.image = cells[indexPath.row].item.mainImage
            cell.nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.mainImageView.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725491405, blue: 0.9725490212, alpha: 1)
            cell.mainImageView.tintColor = UIColor(red: 0.702, green: 0.702, blue: 0.765, alpha: 1)
            cell.nameLabel.text = cells[indexPath.row].item.itemName
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 86, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath;
        collectionView.reloadData()
        handleChangeCategory?(cells[indexPath.row].name);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
