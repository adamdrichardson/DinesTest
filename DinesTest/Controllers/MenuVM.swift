//
//  MenuController.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import SwiftUI

final class MenuVM: ObservableObject {
    @Published var items = [MenuItem]()
    
    init(menuSelection: MenuSelection) {
        getData(menuSelection: menuSelection)
    }
    
    func getData(menuSelection: MenuSelection) {
        ApiHandler.shared.getRemoteMenu(menuSelection: menuSelection, completion: { [weak self] (menuResponse) in
            if let errorMessage = menuResponse.errorString {
                //TODO: Do something with the error message
            }
            
            if let menuItems = menuResponse.menutItems {
                DispatchQueue.main.async {
                    self?.items = menuItems
                }
            }
        })
    }
}
