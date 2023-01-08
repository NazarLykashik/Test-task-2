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

struct BestSeller: Codable{
    let id: Int?
    let is_favorites: Bool?
    let title: String?
    let price_without_discount: Double
    let discount_price: Float
    let picture: String?
}

struct JSONResponce: Decodable{
    let home_store: [HomeStore]?
    let best_seller: [BestSeller]?
}

struct ProductDetails: Decodable, Hashable{
    let CPU: String?
    let camera: String?
    let capacity: [String]?
    let color: [String]?
    let id: String?
    let images: [String]?
    let isFavorites: Bool?
    let price: Int?
    let rating: Float?
    let sd: String?
    let ssd: String?
    let title: String?
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

struct DetailModel{
    var mainImage: UIImage
    
    static func fetchDetails() -> [DetailModel] {
        let firstItem = DetailModel(mainImage: UIImage(named: "Image1")!)
        let secondItem = DetailModel(mainImage: UIImage(named: "Image2")!)
        
        return [firstItem, secondItem]
    }
}
struct Constants{
    
    static let leftDistanceToView: CGFloat = 8
    static let rightDistanceToView: CGFloat = 8
    static let galleryMinimumLineSpacing: CGFloat = 5
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2 )) / 2
    
}
