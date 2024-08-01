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
                        Text("Page view with timer (Carousel)")
                    }
                } header: {
                    Text("UIKit")
                }
            }
            .navigationTitle("UIKit implementations")
        }
    }
}

#Preview {
    ContentView()
}
