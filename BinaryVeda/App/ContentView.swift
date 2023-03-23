//
//  ContentView.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    // Injecting AppEnvironment: Contains DataServices
    @StateObject var appEnvironment: AppEnvironment
    // Injecting AppState: Contains App states
    @StateObject var appState: AppState

    var body: some View {
        let dashboarVM = DashboardViewModel(
            artowrkService: appEnvironment.appSandbox.artworkRepository,
            profileService: appEnvironment.appSandbox.userRespository
        )
        return NavigationContainer {
                Dashboard(viewModel: dashboarVM)
        }
        .environmentObject(appState)
        .sheet(item: $appState.selecteToolBarItem) {
            appState.selecteToolBarItem = nil
        } content: { item in
            // we can add a @ViewBuilder here to show multiple sheets for multiple actions
            Text("\(appState.selecteToolBarItem?.rawValue ?? "")")
        }
        .onAppear{
            let path = Bundle(for: AppEnvironment.self).url(forResource: "Barlow-ExtraLight", withExtension: "tff")
            debugPrint(path)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appEnvironment: AppEnvironment.bootstrap(), appState: AppState.bootstrap())
    }
}
