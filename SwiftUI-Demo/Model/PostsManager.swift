//
//  PostsManager.swift
//  SwiftUI-Demo
//
//  Created by Orlando Neacsu on 01.04.2023.
//

import Foundation

class PostsManager {
    
    private let api = PostsAPI()
    static let shared = PostsManager()
    private init() {}
    
    func getPosts(
        completionHandler: @escaping ([Post]?, Error?) -> Void
    ) {
        api.getPosts(completionHandler: completionHandler)
    }
    
}
