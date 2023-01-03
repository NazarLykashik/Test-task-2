//
//  Model.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 28.12.22.
//

import UIKit

struct HomeStore: Codable{
    let id: Int?
    let is_new: Bool?
    let title: String?
    let subtitle: String?
    let picture: String?
    let is_buy: Bool?
    
}
struct ConstantsHomeStore{
    static let leftDistanceToView: CGFloat = 0
    static let rightDistanceToView: CGFloat = 0
    static let galleryMinimumLineSpacing: CGFloat = 0
    static let galleryItemWidth = 200
    
}

struct BestSeller: Codable{
    let id: Int?
    let is_favorittes: Bool?
    let title: String?
    let price_without_discont: Int?
    let discont_price: Int?
    let picture: String?
}

struct JSONResponce: Decodable{
    let home_store: [HomeStore]?
    let best_seller: [BestSeller]?
}

// MARK: - Select Category
struct SelectCategoryModel{
    var mainImage: UIImage
    var itemName: String
    
    static func fetchModel() -> [SelectCategoryModel] {
        let firstItem = SelectCategoryModel(mainImage: UIImage(named: "PhoneInBar")!,
                                     itemName: "Phones")
        let secondItem = SelectCategoryModel(mainImage: UIImage(named: "ComputerInBar")!,
                                      itemName: "Computer")
        let thirdItem = SelectCategoryModel(mainImage: UIImage(named: "HeartInBar")!,
                                     itemName: "Health")
        let fouthItem = SelectCategoryModel(mainImage: UIImage(named: "BooksInBar")!,
                                     itemName: "Books")
        let fiveItem = SelectCategoryModel(mainImage: UIImage(named: "ComputerInBar")!,
                                      itemName: "Computer")
        let sixItem = SelectCategoryModel(mainImage: UIImage(named: "HeartInBar")!,
                                     itemName: "Health")
        let sevenItem = SelectCategoryModel(mainImage: UIImage(named: "BooksInBar")!,
                                     itemName: "Books")
        return [firstItem, secondItem, thirdItem, fouthItem, fiveItem, sixItem, sevenItem]
    }
}
struct Constants{
    static let leftDistanceToView: CGFloat = 8
    static let rightDistanceToView: CGFloat = 8
    static let galleryMinimumLineSpacing: CGFloat = 5
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2 )) / 2
}
