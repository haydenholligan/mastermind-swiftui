//
//  MastermindApp.swift
//  Mastermind
//
//  Created by Hayden on 9/22/26.
//

import SwiftUI

@main
struct MastermindApp: App {

    let coordinator = GameCoordinator()

    var gameState = GameState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coordinator)
                .environment(\.gameState, gameState)
        }
    }
}


class GameCoordinator: Observable {

    func setCellColor(_ color: Color) {
        print(color)
    }
}

struct GameState {

    var footer: Entries = .init(entry1: .unset, entry2: .unset, entry3: .unset, entry4: .unset)
}

extension EnvironmentValues {
    @Entry var gameState = GameState()
}
