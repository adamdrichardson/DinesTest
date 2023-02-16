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
    
    /**
     Function to get the menu from the remote API
     
     - Parameter menuSelection: enum representing the top level menu selection (type is MenuSelection)
     */
    func getRemoteMenu(menuSelection: MenuSelection, completion: @escaping (MenuResponse) -> Void) {
        let task = URLSession.shared.dataTask(with: self.getEndpoint(menuSelection: menuSelection), completionHandler: { (data, response, error) in
            var errorString: String?
            var menuItemArray: [MenuItem]?
            if let data = data {
                //TODO parse the url response
                menuItemArray = self.handleApiSuccess(data: data)
                errorString = nil
            }
            if let error = error {
                //TODO error handling here
                errorString = self.handleApiError(error: error)
                menuItemArray = nil
            }
            
            let menuResponse = MenuResponse(errorString: errorString, menutItems: menuItemArray)
            
            DispatchQueue.main.async {
                completion(menuResponse)
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
    
    /**
     Function to handle the error from the API
     
     - Note: This would be where you would fire off an error to Crashlytics or an internal analytics platform of choice in order to get some stats on API call failures
     */
    func handleApiError(error: Error) -> String {
        return NSLocalizedString("api.error", comment: "") + error.localizedDescription
    }
    
    /**
     Function to parse the response data from the API
     */
    func handleApiSuccess(data: Data) -> [MenuItem]? {
        let decoder = JSONDecoder()
        
        do {
            let menuItemArray = try decoder.decode([MenuItem].self, from: data)
            return menuItemArray
        } catch {
            print("error decoding the json")
            //This is where you would fire off an error to Crashlytics or an internal analytics platform of choice in order to get some stats on decoder errors. It would be useful to know if these are failing due to an error with the model
            return nil
        }
    }
}
