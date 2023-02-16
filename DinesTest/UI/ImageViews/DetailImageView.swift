//
//  DetailImageView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct DetailImageView: View {
    @ObservedObject var imageLoader: ImageLoader

    init(_ url: String, loadNow: Bool) {
            imageLoader = ImageLoader(imageURL: url, loadNew: loadNow)
        }

        var body: some View {
              Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
        }
}

struct DetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView("https://goldbelly.imgix.net/uploads/showcase_media_asset/image/132029/german-chocolate-killer-brownie-tin-pack.5ebc34160f28767a9d94c4da2e04c4b9.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1", loadNow: true)
    }
}
