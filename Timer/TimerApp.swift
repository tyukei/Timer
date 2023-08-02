//
//  TimerApp.swift
//  Timer
//
//  Created by KeitaNakata on 2023/08/02.
//

import SwiftUI

@main
struct TimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
