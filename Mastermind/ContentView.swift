//
//  ContentView.swift
//  Mastermind
//
//  Created by Hayden on 9/22/26.
//

import SwiftUI

extension Color: @retroactive Identifiable {
    public var id: Color { self }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
            Divider()
            TurnRows()
            Divider()
            Footer()
            ColourPicker()
            Button("Check") {
                print("Checking")
            }
        }
        .padding()
    }
}

struct Header: View {

    var body: some View {
        HStack {
            Circle()
            Circle()
            Circle()
            Circle()
        }
    }
}

struct TurnRows: View {

    private let entryRows = [
        Entries(entry1: .set(.red), entry2: .set(.red), entry3: .set(.red), entry4: .set(.red)),
        Entries(entry1: .set(.red), entry2: .set(.red), entry3: .set(.red), entry4: .set(.blue))
    ]

    var body: some View {
        ForEach(entryRows) { entries in
            TurnRow(entries: entries)
        }
    }
}

struct TurnRow: View {

    let entries: Entries

    var body: some View {
        HStack {
            EntryRow(entries: entries)
            EntryCheck()
        }
    }
}

struct Entries: Identifiable {
    let id = UUID()
    var entry1: EntryState
    var entry2: EntryState
    var entry3: EntryState
    var entry4: EntryState

    var entryList: [EntryState] {
        [entry1, entry2, entry3, entry4]
    }
}

struct EntryRow: View {

    @State var entries: Entries

    var body: some View {
        HStack {
            EntryView(entry: entries.entry1)
            EntryView(entry: entries.entry2)
            EntryView(entry: entries.entry3)
            EntryView(entry: entries.entry4)
        }
    }
}

struct EntryCheck: View {

    var body: some View {
        HStack {
            VStack {
                Circle()
                Circle()
            }
            VStack {
                Circle()
                Circle()
            }
        }
    }
}

enum EntryState {
    case set(Color)
    case unset
}

struct Footer: View {

    @Environment(\.gameState) private var gameState

    var body: some View {
        EntryRow(entries: gameState.footer)
    }
}

struct ColourPicker: View {

    @Environment(GameCoordinator.self) private var gameCoordinator

    let colors: [Color] = [
        .red, .green, .blue,
        .yellow, .brown, .purple,
        .black, .white
    ]

    var body: some View {
        HStack {
            ForEach(colors) { color in
                Button(action: {
                    gameCoordinator.setCellColor(color)
                }, label: {
                    ColorEntry(color: color)
                })
            }
        }
    }
}

struct EntryView: View {

    @State var entry: EntryState

    var body: some View {
        switch entry {
        case .set(let color):
            ColorEntry(color: color)
        case .unset:
            UnsetEntry()
        }
    }
}

struct UnsetEntry: View {

    var body: some View {
        Circle()
            .stroke(
                Color.black,
                style: StrokeStyle(
                    lineWidth: 1.0
                )
            )
    }
}

struct ColorEntry: View {

    let color: Color

    var body: some View {
        Circle()
            .fill(color)
            .stroke(
                Color.black,
                style: StrokeStyle(
                    lineWidth: 1.0
                )
            )
    }
}

#Preview {
    ContentView()
}
