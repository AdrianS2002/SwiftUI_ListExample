//
//  PostsAPI.swift
//  SwiftUI-Demo
//
//  Created by Orlando Neacsu on 01.04.2023.
//

import Foundation

class PostsAPI {
    
    
    func getPosts(
        completionHandler: @escaping ([Post]?, Error?) -> Void
    ) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completionHandler(nil, error)
                } else if let data {
                    do {
                        let posts = try JSONDecoder().decode([Post].self, from: data)
                        completionHandler(posts, nil)
                    } catch {
                        completionHandler(nil ,error)
                    }
                } else {
                    let error = MessageError(message: "sth went wrong")
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
    
}
