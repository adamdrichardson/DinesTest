//
//  ImageLoader.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var imageData = Data()
        
    init(imageURL: String, loadNew: Bool) {
            let cache = URLCache.shared
            let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        
        let data = cache.cachedResponse(for: request)?.data
        
            if data != nil && !loadNew {
                print("got image from cache")
                self.imageData = data!
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response {
                    let cachedData = CachedURLResponse(response: response, data: data)
                                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            print("downloaded from internet")
                            self.imageData = data
                        }
                    }
                }).resume()
            }
        }
    
    func loadImage() {
        
    }
}
