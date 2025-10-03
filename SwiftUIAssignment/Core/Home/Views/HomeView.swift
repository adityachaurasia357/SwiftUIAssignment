//
//  HomeView.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                homeHeader
                homeListView
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, prompt: "Search posts")
        }
        .onAppear {
            LoadingManager.shared.show()
            viewModel.fetchPosts()
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        Text("Posts")
            .font(.largeTitle.bold())
            .padding(.horizontal)
            .padding(.top, 12)
    }
    
    private var homeListView: some View {
        List {
            ForEach(viewModel.filteredPosts) { post in
                NavigationLink(value: post) {
                    PostRow(
                        post: post,
                        onFavoriteTapped: { viewModel.toggleFavorite(for: post) }
                    )
                }
            }
        }
        .listStyle(.plain)
        .refreshable {
            await refreshPosts()
        }
        .navigationDestination(for: Post.self) { post in
            PostDetailView(post: post)
        }
        .loadingOverlay()
    }
    
    private func refreshPosts() async {
        await Task.sleep(1_000_000_000)
        viewModel.fetchPosts()
    }
}
