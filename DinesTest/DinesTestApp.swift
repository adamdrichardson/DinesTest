//
//  DinesTestApp.swift
//  DinesTest
//
//  Created by Adam Richardson on 15/02/2023.
//

import SwiftUI

@main
struct DinesTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
