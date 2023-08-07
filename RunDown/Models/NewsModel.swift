//
//  NewsModel.swift
//  RunDown
//
//  Created by Desi Rorie on 8/6/23.
//

import Foundation

struct NewsModel: Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    let url: String
    var isSaved: Bool = false
}
