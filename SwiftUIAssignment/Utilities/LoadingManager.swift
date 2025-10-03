//
//  LoadingManager.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI
import Combine

final class LoadingManager: ObservableObject {
    static let shared = LoadingManager()
    
    @Published var isLoading: Bool = false
    
    private init() {}
    
    func show() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
