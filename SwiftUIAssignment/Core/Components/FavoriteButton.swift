//
//  FavoritesButtonView.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let onToggle: () -> Void
    var size: CGFloat = 24
    var favoriteColor: Color = .red
    var defaultColor: Color = .gray

    @State private var scale: CGFloat = 1.0

    var body: some View {
        Button(action: {
            onToggle()
            
            withAnimation(.spring(response: 0.35, dampingFraction: 0.5, blendDuration: 0)) {
                scale = 1.4
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.5, blendDuration: 0)) {
                    scale = 1.0
                }
            }
        }) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .foregroundColor(isFavorite ? favoriteColor : defaultColor)
                .scaleEffect(scale)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isFavorite ? "Remove from favorites" : "Add to favorites")
    }
}
