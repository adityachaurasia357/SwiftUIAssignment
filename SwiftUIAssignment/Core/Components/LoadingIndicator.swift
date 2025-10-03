//
//  LoadingIndicator.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct LoadingIndicatorView: View {
    @ObservedObject var manager = LoadingManager.shared
    @State private var isAnimating = false

    let lineWidth: CGFloat = 4
    let size: CGFloat = 50

    var body: some View {
        if manager.isLoading {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.6)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.accentColor.opacity(0.3), .accentColor]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                    .frame(width: size, height: size)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(
                        .linear(duration: 0.8).repeatForever(autoreverses: false),
                        value: isAnimating
                    )

                Circle()
                    .trim(from: 0.0, to: 0.3)
                    .stroke(Color.accentColor.opacity(0.5), lineWidth: lineWidth)
                    .frame(width: size * 0.6, height: size * 0.6)
                    .rotationEffect(.degrees(isAnimating ? -360 : 0))
                    .animation(
                        .linear(duration: 0.6).repeatForever(autoreverses: false),
                        value: isAnimating
                    )
            }
            .onAppear {
                isAnimating = true
            }
            .transition(.opacity)
        }
    }
}

#Preview {
    VStack {
        LoadingIndicatorView()
    }
    .padding()
}
