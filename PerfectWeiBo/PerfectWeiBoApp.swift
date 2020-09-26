//
//  PerfectWeiBoApp.swift
//  PerfectWeiBo
//
//  Created by Joe on 2020/9/26.
//

import SwiftUI

@main
struct PerfectWeiBoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
