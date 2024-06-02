//
//  feat_iosApp.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
//

import SwiftUI
import SwiftData

@main
struct feat_iosApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            OnboardingHomeView(viewModel: .defaultModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
