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
}

