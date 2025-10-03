//
//  PostsDataService.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import Foundation
import Combine

class PostDataService {
    
    @Published var allPosts: [Post] = []
    private var postSubscription: AnyCancellable?

    init() {
        getPosts()
    }

    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        LoadingManager.shared.show()

        postSubscription = NetworkManager.download(url: url)
            .decode(type: [PostResponse].self, decoder: JSONDecoder())
            .map { responses in
                let savedFavorites = UserDefaultsManager.shared.getFavorites()
                return responses.map { resp in
                    Post(
                        id: resp.id,
                        userId: resp.userId,
                        title: resp.title,
                        body: resp.body,
                        isFavorite: savedFavorites.contains(resp.id)
                    )
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkManager.handleCompletion,
                receiveValue: { [weak self] posts in
                    self?.allPosts = posts
                    LoadingManager.shared.hide()
                    self?.postSubscription?.cancel()
                }
            )
    }
}
