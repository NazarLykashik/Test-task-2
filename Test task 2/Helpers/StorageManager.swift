//
//  StarageManager.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 30.12.22.
//

import Foundation


class StorageManager{
    static let shared = StorageManager()
    
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    private var image: [String] = []
    private var card: [Card] = []
    private var basket: [Basket] = []
    private let defaults = UserDefaults.standard
    
    
    func getHomeStore() -> [HomeStore]{
        
        if let data = UserDefaults.standard.data(forKey: "savedHomeStore") {
            do {
                let decoder = JSONDecoder()
                let homeStore = try decoder.decode([HomeStore].self, from: data)
                return homeStore
            } catch {
                print("Unable to Decode places (\(error))")
            }
        }
        return homeStore
    }
    func saveHomeStore(_ store: [HomeStore]){
        guard let homeStoreEncoded = try? JSONEncoder().encode(store) else {return}
        defaults.set(homeStoreEncoded, forKey: "savedHomeStore")
    }

    
    func getBestSeller() -> [BestSeller]{
        
        if let data = UserDefaults.standard.data(forKey: "savedBestSeller") {
            do {
                let decoder = JSONDecoder()
                let bestSeller = try decoder.decode([BestSeller].self, from: data)
                return bestSeller
            } catch {
                print("Unable to Decode places (\(error))")
            }
        }
        return bestSeller
    }
    func saveBestSeller(_ store: [BestSeller]){
        guard let bestSellerEncoded = try? JSONEncoder().encode(store) else {return}
        defaults.set(bestSellerEncoded, forKey: "savedBestSeller")
    }
    
    func getBasket() -> [Basket]{
        
        if let data = UserDefaults.standard.data(forKey: "savedBasket") {
            do {
                let decoder = JSONDecoder()
                let basket = try decoder.decode([Basket].self, from: data)
                return basket
            } catch {
                print("Unable to Decode places (\(error))")
            }
        }
        return basket
    }
    func saveBasket(_ basket: [Basket]){
        guard let basketEncoded = try? JSONEncoder().encode(basket) else {return}
        defaults.set(basketEncoded, forKey: "savedBasket")
    }
    
    func getImage() -> [String]{
        
        if let data = UserDefaults.standard.data(forKey: "savedImage") {
            do {
                let decoder = JSONDecoder()
                let image = try decoder.decode([String].self, from: data)
                return image
            } catch {
                print("Unable to Decode places (\(error))")
            }
        }
        return image
    }
    func saveImage(_ image: [String]){
        guard let imageEncoded = try? JSONEncoder().encode(image) else {return}
        defaults.set(imageEncoded, forKey: "savedImage")
    }
}



