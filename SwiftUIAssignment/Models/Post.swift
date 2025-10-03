//
//  Post.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

struct Post: Identifiable, Equatable, Hashable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    var isFavorite: Bool = false
}
