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
    
    private var SelectCategoryColectionView = SelectCategoryCollectionView()
    private var HotSalesColectionView = HotSalesCollectionView()
    
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let jsonUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"

    override func viewDidLoad() {
        fechData()
        super.viewDidLoad()
        
        view.addSubview(SelectCategoryColectionView)
        
        SelectCategoryColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        SelectCategoryColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        SelectCategoryColectionView.topAnchor.constraint(equalTo: LabelOfCategory.bottomAnchor, constant: 5).isActive = true
        SelectCategoryColectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        SelectCategoryColectionView.set(cells: SelectCategoryModel.fetchModel())
        
        view.addSubview(HotSalesColectionView)
        
        HotSalesColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        HotSalesColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        HotSalesColectionView.topAnchor.constraint(equalTo: LabelOfHotSales.bottomAnchor, constant: 5).isActive = true
        HotSalesColectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        HotSalesColectionView.set(cellsHotSales: HomeStore.fetchHomeStore())
        
    }
    func fechData(){
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let phones = try JSONDecoder().decode(JSONResponce.self, from: data)
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
}

