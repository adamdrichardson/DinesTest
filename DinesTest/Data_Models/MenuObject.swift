//
//  MenuObject.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation

/**
 Structure for the menu response from the API, this includes an array of MenuItem objects as well as an error string
 
 - Note: Both items are optional as the object should either contain an error string or an array of MenuItem objects not both
 */
struct MenuResponse: Codable {
    var errorString: String?
    var menutItems: [MenuItem]?
}

/**
 Structure for the menu item from the API
 
 - Note: All items have been made optional so that if the API changes or fails to return on or more of the variables for some reason then the app wont be expecting the variable and therefore will not crash when decoding
 */
public struct MenuItem: Codable, Identifiable, Hashable {
    public let id = UUID()
    var itemId: String?
    var imageString: String?
    var name: String?
    var description: String?
    var price: Double?
    var rate: Int?
    var location: String?
    
    enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case imageString = "img"
        case name = "name"
        case description = "dsc"
        case price = "price"
        case rate = "rate"
        case location = "country"
    }
}
