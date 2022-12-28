//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 28.12.22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let jsonUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"

    override func viewDidLoad() {
        fechData()
        super.viewDidLoad()
        
    }
    func fechData(){
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let phones = try JSONDecoder().decode(JSONResponce.self, from: data)
                print(phones.best_seller ?? [])
                print(phones.home_store ?? [])
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
}

