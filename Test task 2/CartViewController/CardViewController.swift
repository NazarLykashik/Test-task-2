//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 8.01.23.
//

import UIKit


class CardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var deliveryPriceLabel: UILabel!
    @IBOutlet var addAdressLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var deliveryLabel: UILabel!
    @IBOutlet var checoutBotton: UIButton!
    
    
    let jsonUrl = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    var basket: [Basket] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPriceLabel.font = UIFont.init(name: "MarkPro-Bold", size: 15)
        totalLabel.font = UIFont.init(name: "MarkPro", size: 15)
        deliveryPriceLabel.font = UIFont.init(name: "MarkPro-Bold", size: 15)
        deliveryLabel.font = UIFont.init(name: "MarkPro", size: 15)
        mainLabel.font = UIFont.init(name: "MarkPro-Bold", size: 40)
        addAdressLabel.font = UIFont.init(name: "MarkPro", size: 17)
        checoutBotton.titleLabel!.font = UIFont.init(name: "MarkPro", size: 24)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        basket = StorageManager.shared.getBasket()
        
        fechData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        let cells = basket[indexPath.row]
        cell.configure(with: cells)
        return cell
    }
    
    func fechData(){
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let card = try JSONDecoder().decode(Card.self, from: data)

                self.basket = card.basket ?? []
                StorageManager.shared.saveBasket(self.basket)
                
                
                DispatchQueue.main.async {
                    self.totalPriceLabel.text = "$ \(Int(card.total ?? 0))"
                    self.deliveryPriceLabel.text = card.delivery
                    self.collectionView.reloadData()

                }
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
}
