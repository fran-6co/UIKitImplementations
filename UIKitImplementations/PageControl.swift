//
//  PageControl.swift
//  RickMortyAPI
//
//  Created by Fran Ochoa on 25/7/24.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    let color = UIColor.white
    
    final class Coordinator: NSObject, UIPageControlTimerProgressDelegate {
        var parent: PageControl
        
        init(_ parent: PageControl) {
            self.parent = parent
        }
        
        func pageControlTimerProgress(_ progress: UIPageControlTimerProgress, shouldAdvanceToPage page: Int) -> Bool {
            parent.currentPage = page
            return true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = color
        control.pageIndicatorTintColor = color.withAlphaComponent(0.5)
//        control.preferredIndicatorImage = UIImage(systemName: "phone")
        
        let progress = UIPageControlTimerProgress(preferredDuration: 5)
        progress.resetsToInitialPageAfterEnd = true
        progress.delegate = context.coordinator
        control.progress = progress
        
        progress.resumeTimer()
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
}
