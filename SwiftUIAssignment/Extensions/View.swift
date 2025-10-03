//
//  View.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUICore

extension View {
    func showIndicator() {
        LoadingManager.shared.show()
    }
    
    func hideIndicator() {
        LoadingManager.shared.hide()
    }
    
    func loadingOverlay() -> some View {
        ZStack {
            self
            LoadingIndicatorView()
        }
    }
}
