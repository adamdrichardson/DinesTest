//
//  ApiHandler.swift
//  DinesTest
//
//  Created by Adam Richardson on 15/02/2023.
//

import Foundation

/**
 This class is for handling API requests
 */
final class ApiHandler {
    func getRemoteMenu(menuSelection: MenuSelection) {
        let task = URLSession.shared.dataTask(with: self.getEndpoint(menuSelection: menuSelection), completionHandler: { (data, response, error) in
            if let data = data {
                //TODO parse the url response
            }
            if let error = error {
                //TODO error handling here
            }
        })
        task.resume()
    }
    
    /**
     Function to get the endpoint for the chosen top level menu selection
     */
    func getEndpoint(menuSelection: MenuSelection) -> URL {
        switch menuSelection {
        case .food:
            return Constants.urls.bestFoods
        case .desert:
            return Constants.urls.deserts
        case .drink:
            return Constants.urls.drinks
        }
    }
}
