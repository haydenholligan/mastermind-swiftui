//
//  MastermindApp.swift
//  Mastermind
//
//  Created by Hayden on 9/22/26.
//

import SwiftUI

@main
struct MastermindApp: App {

    @State private var gameState = GameState()

    let coordinator: GameCoordinator

    init() {
        let gameState = GameState()
        self.gameState = gameState
        self.coordinator = GameCoordinator(gameState: gameState)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coordinator)
                .environment(\.gameState, gameState)
        }
    }
}


class GameCoordinator: Observable {

    var gameState: GameState

    init(gameState: GameState) {
        self.gameState = gameState
    }

    func setCellColor(_ color: Color) {
        if case .unset = gameState.footer.entry1 {
            print(":) gameState.footer.entry1=\(gameState.footer.entry1)")
            gameState.footer.entry1 = .set(color)
            print(":) gameState.footer.entry1=\(gameState.footer.entry1)")
        }
    }
}

@Observable
class GameState {

    var footer: Entries = .init(entry1: .unset, entry2: .unset, entry3: .unset, entry4: .unset)
}

extension EnvironmentValues {
    @Entry var gameState = GameState()
}
