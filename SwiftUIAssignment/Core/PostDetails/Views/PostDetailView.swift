//
//  PostDetailView.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                postTitle
                postBody
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension PostDetailView {
    private var postTitle: some View {
        Text(post.title)
            .font(.title2.bold())
            .multilineTextAlignment(.leading)
    }
    
    private var postBody: some View {
        Text(post.body)
            .font(.body)
            .foregroundStyle(.secondary)
    }

}

#Preview {
    NavigationStack {
        PostDetailView(post: .init(id: 1, userId: 101, title: "Sample Post Title", body: "This is the body of the post. It can be long and scrollable.", isFavorite: true))
    }
}
