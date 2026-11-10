//
//  FinalProject_GoalTrackerApp.swift
//  FinalProject_GoalTracker
//
//  Created by student on 10/25/26.
//

import SwiftUI
import SwiftData

@main
struct FinalProject_GoalTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: GoalCard.self)
    }
}
