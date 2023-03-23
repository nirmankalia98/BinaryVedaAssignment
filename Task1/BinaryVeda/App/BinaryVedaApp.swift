//
//  BinaryVedaApp.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 21/03/23.
//

import SwiftUI

@main
struct BinaryVedaApp: App {
    // Injecting AppEnvironment: Contains DataServices
    @StateObject var appEnvironment = AppEnvironment.bootstrap()
    // Injecting AppState: Contains App states
    @StateObject var appState = AppState.bootstrap()

    var body: some Scene {
        WindowGroup {
            ContentView(appEnvironment: AppEnvironment.bootstrap(), appState: AppState.bootstrap())
        }
    }
}
