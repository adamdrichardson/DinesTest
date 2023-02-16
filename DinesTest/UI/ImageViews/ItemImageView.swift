//
//  ItemImageView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct ItemImageView: View {
    
    var urlString: String
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 0, idealWidth: 100, maxWidth: 250, minHeight: 0, idealHeight: 100, maxHeight: 250, alignment: .center)
            .onReceive(imageLoader.$image, perform: { image in
                self.image = image
            })
            .onAppear(perform: {
                imageLoader.loadImage(for: urlString)
            })
    }
}

struct ItemImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageView(urlString: "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/132029/german-chocolate-killer-brownie-tin-pack.5ebc34160f28767a9d94c4da2e04c4b9.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1")
    }
}
