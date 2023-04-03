//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by Orlando Neacsu on 01.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
       
        switch viewModel.postsState {
        case .loading:
            ProgressView()
            
        case .error(let error):
            Text("Eroare")
        case .posts(let posts):
            ScrollView {
                ForEach(posts, id: \.id) { post in
                    VStack {
                        Text(post.title)
                        Text(post.body)
                    }.background(Color.red)
                        .padding(.bottom, 10)
                }
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
