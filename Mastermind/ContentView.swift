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

    private let rows = [1,2,3]

    var body: some View {
        ForEach(rows.indices) { rowIndex in
            TurnRow()
        }
    }
}

struct TurnRow: View {

    var body: some View {
        HStack {
            Entry()
            EntryCheck()
        }
    }
}


struct Entry: View {

    var body: some View {
        HStack {
            Circle()
            Circle()
            Circle()
            Circle()
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

struct Footer: View {

    var body: some View {
        Entry()
    }
}

struct ColourPicker: View {

    let colors: [Color] = [
        .red, .green, .blue,
        .yellow, .brown, .purple,
        .black, .white
    ]

    var body: some View {
        HStack {
            ForEach(colors) { color in
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
    }
}

#Preview {
    ContentView()
}
