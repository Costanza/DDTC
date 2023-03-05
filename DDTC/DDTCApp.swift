//
//  DDTCApp.swift
//  DDTC
//
//  Created by Chris Mayer on 5/3/2023.
//

import SwiftUI

@main
struct DDTCApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
