//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 28.12.22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet var LabelOfCategory: UILabel!
    @IBOutlet var LabelOfHotSales: UILabel!
    @IBOutlet var LabelOfBestSellers: UILabel!
    
    private var SelectCategoryColectionView = SelectCategoryCollectionView()
    private var HotSalesColectionView = HotSalesCollectionView()
    private var BestSellersCollectionView = BestSellerCollectionViewController()
    
    private var bothPages: [JSONResponce] = []
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let jsonUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"

    override func viewDidLoad() {
        super.viewDidLoad()
        fechData()
        homeStore = StorageManager.shared.getHomeStore()
        bestSeller = StorageManager.shared.getBestSeller()
        
        view.addSubview(SelectCategoryColectionView)
        
        SelectCategoryColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        SelectCategoryColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        SelectCategoryColectionView.topAnchor.constraint(equalTo: LabelOfCategory.bottomAnchor, constant: 5).isActive = true
        SelectCategoryColectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        SelectCategoryColectionView.set(cells: SelectCategoryModel.fetchModel())
        
        
        view.addSubview(HotSalesColectionView)
        
        HotSalesColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        HotSalesColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        HotSalesColectionView.topAnchor.constraint(equalTo: LabelOfHotSales.bottomAnchor, constant: 5).isActive = true
        HotSalesColectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(BestSellersCollectionView)
        
        BestSellersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        BestSellersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        BestSellersCollectionView.topAnchor.constraint(equalTo: LabelOfBestSellers.bottomAnchor, constant: 5).isActive = true
        BestSellersCollectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
    }
    
    
    func fechData(){
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let phones = try JSONDecoder().decode(JSONResponce.self, from: data)
                self.homeStore = phones.home_store ?? []
                self.bestSeller = phones.best_seller ?? []
                StorageManager.shared.saveHomeStore(self.homeStore)
                StorageManager.shared.saveBestSeller(self.bestSeller)
                
                DispatchQueue.main.async {
                    self.HotSalesColectionView.reloadData()
                }
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
}

