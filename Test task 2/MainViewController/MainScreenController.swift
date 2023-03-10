//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 28.12.22.
//

import UIKit

class MainScreenViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var LabelOfCategory: UILabel!
    @IBOutlet var LabelOfHotSales: UILabel!
    @IBOutlet var LabelOfBestSellers: UILabel!
    @IBOutlet var foter: UIView!
    @IBOutlet var filter: UIView!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var closeFiler: UIButton!
    @IBOutlet var LabelOfGeo: UIButton!
    @IBOutlet var labelViewAll: UIButton!
    @IBOutlet var labelSeeMore1: UIButton!
    @IBOutlet var labelSeeMore2: UIButton!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var buttonExplore: UIButton!
    
    private var SelectCategoryColectionView = SelectCategoryCollectionView()
    private var HotSalesColectionView = HotSalesCollectionView()
    private var BestSellersCollectionView = BestSellerCollectionViewController()

    
    private var bothPages: [JSONResponce] = []
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let jsonUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    let findTextFieldImageView = UIImageView(frame: CGRect(x: 8.0, y: 10.0, width: 20.0, height: 20.0))
    let image = UIImage(named: "SearchImage")
    let findTextFieldView = UIView(frame: CGRect(x: 0, y: 0, width: 38, height: 40))

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filter.makeShadow()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeUp.delegate = self
        swipeUp.direction =  UISwipeGestureRecognizer.Direction.up
        self.mainView.addGestureRecognizer(swipeDown)
        self.mainView.addGestureRecognizer(swipeUp)
        
        findTextFieldImageView.image = image
        findTextFieldImageView.contentMode = .scaleAspectFit
        findTextFieldView.addSubview(findTextFieldImageView)
        searchTextField.leftViewMode = UITextField.ViewMode.always
        searchTextField.leftView = findTextFieldView
        
        LabelOfGeo.titleLabel?.font  = UIFont.init(name: "MarkPro", size: 17)!
        labelViewAll.titleLabel?.font  = UIFont.init(name: "MarkPro", size: 17)!
        labelSeeMore1.titleLabel?.font  = UIFont.init(name: "MarkPro", size: 17)!
        labelSeeMore2.titleLabel?.font  = UIFont.init(name: "MarkPro", size: 17)!
        buttonExplore.titleLabel?.font  = UIFont.init(name: "MarkPro", size: 17)!
        
        
        checkAvailableFonts()
        fechData()
        homeStore = StorageManager.shared.getHomeStore()
        bestSeller = StorageManager.shared.getBestSeller()
        
                
        view.addSubview(SelectCategoryColectionView)
        
        SelectCategoryColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        SelectCategoryColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        SelectCategoryColectionView.topAnchor.constraint(equalTo: LabelOfCategory.bottomAnchor, constant: 5).isActive = true
        SelectCategoryColectionView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        
        SelectCategoryColectionView.set(cells: SelectCategoryModel.fetchModel())
        
        
        view.addSubview(HotSalesColectionView)
        
        SelectCategoryColectionView.handleChangeCategory = handleChangeCategory
        
        HotSalesColectionView.handleClick = {
            self.openProductDetails()
        }
        BestSellersCollectionView.handleClick = {
            self.openProductDetails()
        }
            
        HotSalesColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        HotSalesColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        HotSalesColectionView.topAnchor.constraint(equalTo: LabelOfHotSales.bottomAnchor, constant: 5).isActive = true
        HotSalesColectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(BestSellersCollectionView)
        
        BestSellersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        BestSellersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        BestSellersCollectionView.topAnchor.constraint(equalTo: LabelOfBestSellers.bottomAnchor, constant: 5).isActive = true
        BestSellersCollectionView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        
        view.addSubview(foter)
        view.addSubview(filter)
        
            
            
        }
    
        
        func openProductDetails(){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let secondVC = storyboard.instantiateViewController(identifier: "detailViewController") as! DetailViewController
            
            self.present(secondVC, animated: true, completion: nil)
        }

    func handleChangeCategory (category: Category) {
        if category != Category.Phones {
            HotSalesColectionView.isHidden = true;
            BestSellersCollectionView.isHidden = true;
            
        }
        else {
            HotSalesColectionView.isHidden = false;
            BestSellersCollectionView.isHidden = false;
        }
    }
    

    
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        if filter.isHidden == true {
            filter.isHidden = false
        }else{
            filter.isHidden = true
        }
        
    }
    @IBAction func closeFilterPress(_ sender: Any) {
        filter.isHidden = true
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
                    self.BestSellersCollectionView.reloadData()
                }
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
    
    func checkAvailableFonts(){
        UIFont.familyNames.forEach { familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
        }
}

