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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coordinator)
        }
    }
}


class GameCoordinator: Observable {

    func setCellColor(_ color: Color) {
        print("hello")
    }
}
