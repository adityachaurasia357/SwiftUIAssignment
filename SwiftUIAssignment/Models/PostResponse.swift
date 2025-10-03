//
//  PostResponse.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

struct PostResponse: Decodable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
