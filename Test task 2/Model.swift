//
//  Model.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 28.12.22.
//

import UIKit

struct HomeStore: Decodable{
    let id: Int?
    let is_new: Bool?
    let title: String?
    let subtitle: String?
    let picture: String?
    let is_buy: Bool?
    
}

struct BestSeller: Decodable{
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
struct GalleryModel{
    var mainImage: UIImage
    var itemName: String
    
    static func fetchModel() -> [GalleryModel] {
        let firstItem = GalleryModel(mainImage: UIImage(named: "PhoneInBar")!,
                                     itemName: "Phones")
        let secondItem = GalleryModel(mainImage: UIImage(named: "ComputerInBar")!,
                                      itemName: "Computer")
        let thirdItem = GalleryModel(mainImage: UIImage(named: "HeartInBar")!,
                                     itemName: "Health")
        let fouthItem = GalleryModel(mainImage: UIImage(named: "BooksInBar")!,
                                     itemName: "Books")
        let fiveItem = GalleryModel(mainImage: UIImage(named: "ComputerInBar")!,
                                      itemName: "Computer")
        let sixItem = GalleryModel(mainImage: UIImage(named: "HeartInBar")!,
                                     itemName: "Health")
        let sevenItem = GalleryModel(mainImage: UIImage(named: "BooksInBar")!,
                                     itemName: "Books")
        return [firstItem, secondItem, thirdItem, fouthItem, fiveItem, sixItem, sevenItem]
    }
}

