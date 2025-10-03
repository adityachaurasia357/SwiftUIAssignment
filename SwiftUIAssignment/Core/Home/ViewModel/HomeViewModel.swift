//
//  HomeViewModel.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()
    private let postService = PostDataService()

    init() {
        addRequiredSubscribers()
    }
    
    /// add all the required subscribers
    private func addRequiredSubscribers() {
        addAllPostSubscriber()
        // More can be added later on
    }
    
    /// allPosts subscriber
    private func addAllPostSubscriber() {
        postService.$allPosts
            .sink { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }

    /// Call this function explicitly to fetch posts
    func fetchPosts() {
        postService.getPosts()
    }

    /// Filtered posts for search
    var filteredPosts: [Post] {
        guard !searchText.isEmpty else { return posts }
        return posts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    /// Toggle favorite and save in UserDefaults
    func toggleFavorite(for post: Post) {
        guard let index = posts.firstIndex(where: { $0.id == post.id }) else { return }
        posts[index].isFavorite.toggle()

        let favorites = Set(posts.filter { $0.isFavorite }.map { $0.id })
        UserDefaultsManager.shared.saveFavorites(favorites)
    }
}
