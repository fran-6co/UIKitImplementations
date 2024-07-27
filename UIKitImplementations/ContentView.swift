//
//  SwiftUIView.swift
//  UIKitImplementations
//
//  Created by Fran Ochoa on 27/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        PageView()
                    } label: {
                        Text("1. Page view with timer")
                    }
                } header: {
                    Text("UIKit")
                }
                Section {
                    Text("nothing yet")
                } header: {
                    Text("SwiftUI")
                }
            }
            .navigationTitle("Views")
        }
    }
}

#Preview {
    ContentView()
}
