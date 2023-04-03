//
//  PostsViewModel.swift
//  SwiftUI-Demo
//
//  Created by Orlando Neacsu on 01.04.2023.
//

import Foundation

enum PostsState {
    case loading
    case error(Error)
    case posts([Post])
}

class PostsViewModel: ObservableObject {
    
    private let postsManager = PostsManager.shared
    
    @Published var postsState = PostsState.loading
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        postsState = .loading
        postsManager.getPosts { [weak self] posts, error in
            guard let self else {return}
            if let error {
                self.postsState = .error(error)
            } else if let posts {
                self.postsState = .posts(posts)
            }
        }
    }
}
