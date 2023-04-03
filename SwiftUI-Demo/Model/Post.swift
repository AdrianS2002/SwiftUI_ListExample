//
//  Post.swift
//  SwiftUI-Demo
//
//  Created by Orlando Neacsu on 01.04.2023.
//

import Foundation

struct Post: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
