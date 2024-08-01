//
//  ContentView.swift
//  UIKitImplementations
//
//  Created by Fran Ochoa on 26/7/24.
//

import SwiftUI

struct Page: View {
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
    }
}

struct PageView: View {
    let imageNames: [String] = ["torresdelpaine", "peritomoreno", "fitzroy"]
    let gradientColors = Gradient(colors: [Color.gray.opacity(0.7), Color.mint.opacity(0.7)])
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            Text("Page viewer")
                .font(.largeTitle)
                .underline()
                .padding(10)
            Text("This view shows the `UIPageViewController` with a `UIPageControl` (UIKit elements) embedded in a SwiftUI view using the `UIViewControllerRepresentable`. In this specific case, it is also implemented the `UIPageControlTimerProgress` class is used to imitate the famous Featured shows on the TV app.")
                .padding(10)
                .frame(width: .infinity, height: 200)
            ZStack (alignment: .bottom){
                PageViewUIKitController(pages: imageNames.map { Page(name: $0) }, currentPage: $currentPage)
                PageControl(numberOfPages: imageNames.map{ Page(name: $0) }.count, currentPage: $currentPage)
                    .frame(width: CGFloat(imageNames.map{ Page(name: $0) }.count * 18)) //makes width according to what should measure each dot times how many dots.
            }
            .padding(.top, 10)
            .frame(height: 300)
            Text("Current page:   `#\(currentPage + 1)`")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{ LinearGradient(gradient: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing) }
        .ignoresSafeArea()
    }
}

#Preview {
    PageView()
}

