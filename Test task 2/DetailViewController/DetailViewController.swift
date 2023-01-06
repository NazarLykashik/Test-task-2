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
    
    

    var compacity = [String]()
    var color = [String]()

    

    private let jsonUrl = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capacity1.backgroundColor = #colorLiteral(red: 0.9978172183, green: 0.432729274, blue: 0.3063272238, alpha: 1)
        color2.titleLabel?.isHidden = true
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
                
                DispatchQueue.main.async {
                    self.capacity1.setTitle("\(self.compacity[0]) GB", for: .normal)
                    self.capacity2.setTitle("\(self.compacity[1]) GB", for: .normal)
                    self.color1.layer.backgroundColor = (self.hexStringToUIColor(hex: self.color[0])).cgColor
                    self.color2.layer.backgroundColor = (self.hexStringToUIColor(hex: self.color[1])).cgColor
                }
            }
            catch let error{
                print(error)
            }
        }.resume()
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
