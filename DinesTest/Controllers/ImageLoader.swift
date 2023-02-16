//
//  ImageLoader.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: UIImage = UIImage()
        
    func loadImage(for urlString: String) {
        print("loadImage: \(urlString)")
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                print("we have loaded an image")
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
