//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 8.01.23.
//

import UIKit


class CardViewController: UIViewController {
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var deliveryLabel: UILabel!
    
    private var cartCollectionView = CartCollectionView()
    
    
    let jsonUrl = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    var basket: [Basket] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fechData()
        
        basket = StorageManager.shared.getBasket()
        view.addSubview(cartCollectionView)


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
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
                    self.deliveryLabel.text = card.delivery
                    self.cartCollectionView.reloadData()

                }
            }
            catch let error{
                print(error)
            }
        }.resume()
    }



}
