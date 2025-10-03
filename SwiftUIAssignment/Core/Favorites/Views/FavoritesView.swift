//
//  FavoritesView.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    private var favoritePosts: [Post] {
        viewModel.posts.filter { $0.isFavorite }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if favoritePosts.isEmpty {
                    emptyStateView
                } else {
                    favoritesListView
                }
            }
            .navigationTitle("Favorites")
            .animation(.default, value: favoritePosts) // smooth update
        }
    }
}

extension FavoritesView {
    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Text("No Favorites Yet")
                .font(.title3.bold())
            
            Text("Mark posts with the heart button and they’ll appear here.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
    
    private var favoritesListView: some View {
        List {
            ForEach(favoritePosts) { post in
                NavigationLink(value: post) {
                    PostRow(
                        post: post,
                        onFavoriteTapped: { viewModel.toggleFavorite(for: post) }
                    )
                }
            }
        }
        .listStyle(.plain)
        .navigationDestination(for: Post.self) { post in
            PostDetailView(post: post)
        }
    }
}

#Preview {
    FavoritesView(viewModel: HomeViewModel())
}
