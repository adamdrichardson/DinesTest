//
//  MenuController.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import SwiftUI

class MenuVM: ObservableObject {
    @Published var items = [MenuItem]()
    
    init(menuSelection: MenuSelection) {
        getData(menuSelection: menuSelection)
    }
    
    func getData(menuSelection: MenuSelection) {
        ApiHandler.shared.getRemoteMenu(menuSelection: menuSelection, completion: { [weak self] (menuResponse) in
            if let errorMessage = menuResponse.errorString {
                //TODO: Do something with the error message
                print("there was an error: \(errorMessage)")
                let errorMsgDict:[String : String] = ["error": errorMessage]
                NotificationCenter.default.post(name: Constants.notificationNames.apiErrorNotification, object: nil, userInfo: errorMsgDict)
            }
            
            if let menuItems = menuResponse.menutItems {
                DispatchQueue.main.async {
                    self?.items = menuItems
                }
            }
        })
    }
}
