//
//  ViewController.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 5.01.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var capacity1: UIButton!
    @IBOutlet var capacity2: UIButton!
    @IBOutlet var color1: UIButton!
    @IBOutlet var color2: UIButton!
    
    @IBOutlet var cpuLabel: UILabel!
    @IBOutlet var cameraLabel: UILabel!
    @IBOutlet var ssdMemory: UILabel!
    @IBOutlet var sdMemory: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var addToBusketButton: UIButton!
    @IBOutlet var productDetailLabel: UILabel!
    @IBOutlet var favariteButton: UIButton!
    
    
    @IBOutlet var star1: UIImageView!
    @IBOutlet var star2: UIImageView!
    @IBOutlet var star3: UIImageView!
    @IBOutlet var star4: UIImageView!
    @IBOutlet var star5: UIImageView!
    
    @IBOutlet var detailView: UIView!
    

    let starRaitingCount: Float = 5
    
    var isFavorite: Bool = true
    
    var compacity = [String]()
    var color = [String]()
    var pictire = [String]()

    

    private let jsonUrl = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    private var detailCollectionView = DetailCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.makeShadow()

        
        view.addSubview(detailCollectionView)
        
        detailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailCollectionView.topAnchor.constraint(equalTo: productDetailLabel.bottomAnchor, constant: 10).isActive = true
        detailCollectionView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
        detailCollectionView.set(cells: DetailModel.fetchDetails())
        
        
        capacity1.backgroundColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
        color2.titleLabel?.isHidden = true
        
        star1.image = #imageLiteral(resourceName: "Star ")
        star2.image = #imageLiteral(resourceName: "Star ")
        star3.image = #imageLiteral(resourceName: "Star ")
        star4.image = #imageLiteral(resourceName: "Star ")
        star5.image = #imageLiteral(resourceName: "Star ")
        
        fechData()



        
    }
    
    @IBAction func capacity1Select(_ sender: Any) {
        capacity2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        capacity1.backgroundColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
        
        capacity1.setTitleColor(.white, for: .normal)
        capacity2.setTitleColor(.black, for: .normal)
        
        
    }
    
    @IBAction func capacity2Select(_ sender: Any) {
        capacity1.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        capacity2.layer.backgroundColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
        
        capacity1.setTitleColor(.black, for: .normal)
        capacity2.setTitleColor(.white, for: .normal)
    }
    @IBAction func color1Select(_ sender: Any) {
        color1.titleLabel?.isHidden = false
        color2.titleLabel?.isHidden = true
    }
    @IBAction func color2Select(_ sender: Any) {
        color2.titleLabel?.isHidden = false
        color1.titleLabel?.isHidden = true
        
    }
    
    
    
    
    
    
    
    func fechData(){
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let phone = try JSONDecoder().decode(ProductDetails.self, from: data)
                
                self.compacity = phone.capacity ?? ["nil"]
                self.color = phone.color ?? ["nil"]
                self.pictire = phone.images ?? ["nil"]
                
                DispatchQueue.main.async {
                    self.capacity1.setTitle("\(self.compacity[0]) GB", for: .normal)
                    self.capacity2.setTitle("\(self.compacity[1]) GB", for: .normal)
                    self.color1.layer.backgroundColor = (self.hexStringToUIColor(hex: self.color[0])).cgColor
                    self.color2.layer.backgroundColor = (self.hexStringToUIColor(hex: self.color[1])).cgColor
                    self.isFavorite = phone.isFavorites ?? false
                    self.fafotiteCheck()
                    self.cpuLabel.text = phone.CPU
                    self.cameraLabel.text = phone.camera
                    self.ssdMemory.text = phone.ssd
                    self.sdMemory.text = phone.sd
                    self.titleLabel.text = phone.title
                    self.raiting(starRaitingCount: phone.rating ?? 0)
                    self.addToBusketButton.titleLabel?.text = ("Add to Cart $ \(phone.price ?? 0)")
                }
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
    
    private func raiting (starRaitingCount: Float){
        switch starRaitingCount{
        case 0:
            star1.image = #imageLiteral(resourceName: "StarUnselected")
            star2.image = #imageLiteral(resourceName: "StarUnselected")
            star3.image = #imageLiteral(resourceName: "StarUnselected")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 0.5:
            star1.image = #imageLiteral(resourceName: "Star0.5")
            star2.image = #imageLiteral(resourceName: "StarUnselected")
            star3.image = #imageLiteral(resourceName: "StarUnselected")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 1:
            star2.image = #imageLiteral(resourceName: "StarUnselected")
            star3.image = #imageLiteral(resourceName: "StarUnselected")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 1.5:
            star2.image = #imageLiteral(resourceName: "Star0.5")
            star3.image = #imageLiteral(resourceName: "StarUnselected")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 2:
            star3.image = #imageLiteral(resourceName: "StarUnselected")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 2.5:
            star3.image = #imageLiteral(resourceName: "Star0.5")
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 3:
            star4.image = #imageLiteral(resourceName: "StarUnselected")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 3.5:
            star4.image = #imageLiteral(resourceName: "Star0.5")
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 4:
            star5.image = #imageLiteral(resourceName: "StarUnselected")
            break
        case 4.5:
            star5.image = #imageLiteral(resourceName: "Star0.5")
            break
        default:
            return
        }

    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func fafotiteCheck(){
        if isFavorite == false{
            favariteButton.imageView?.image = #imageLiteral(resourceName: "LikeUnselected")
        }else{
            favariteButton.imageView?.image = #imageLiteral(resourceName: "LikeVector")
        }
    }
}
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
extension UIView {
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 5
    }
}
