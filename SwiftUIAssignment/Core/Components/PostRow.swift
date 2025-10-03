//
//  PostRow.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    let onFavoriteTapped: () -> Void
    
    var body: some View {
        HStack {
            infoText
            Spacer()
            favoritesButton
        }
        .padding(.vertical, 4)
    }
}

extension PostRow {
    private var infoText: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(post.title)
                .font(.headline)
            Text("User ID: \(post.userId)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var favoritesButton: some View {
        FavoriteButton(
            isFavorite: post.isFavorite,
            onToggle: onFavoriteTapped
        )
    }
}

#Preview {
    PostRow(post: Post(id: 1, userId: 2, title: "Sample Title", body: "Sample Body", isFavorite: true)) {
        print("Favorite Tapped")
    }
}
