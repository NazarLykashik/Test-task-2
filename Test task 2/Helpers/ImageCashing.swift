//
//  ImageCashing.swift
//  Test task 2
//
//  Created by Nazar Lykashik on 30.12.22.
//

import UIKit

class ImageView: UIImageView{
    
    func fetchImage(with url: String?){
        guard let url = url else {return}
        guard let imageURL = url.getURl() else{
            image = UIImage(named: "Image")
            return
        }
        if let cashedImage = getCashedImage(url: imageURL){
            image = cashedImage
            return
        }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {print(error); return}
            guard let data = data, let response = response else {return}
            guard let responseURL = response.url else {return}
            
            if responseURL.absoluteString != url {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            self.saveImageToCache(data: data, response: response)
        }.resume()
    }
    
    private func saveImageToCache(data: Data, response: URLResponse){
        guard let responseURL = response.url else {return}
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
    private func getCashedImage(url: URL) -> UIImage?{
        if let cashedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)){
            return UIImage(data: cashedResponse.data)
        }
        return nil
    }
}

fileprivate extension String{
    func getURl() -> URL?{
        guard let url = URL(string: self) else {return nil}
        return url
    }
}

