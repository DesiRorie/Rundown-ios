//
//  NewsViewModel.swift
//  RunDown
//
//  Created by Desi Rorie on 8/6/23.
//

import Foundation

import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var news: [NewsModel] = []
    @Published var SavedNews: [NewsModel] = []
    
    
    func isNewsLiked(news: NewsModel) -> Bool{
        return SavedNews.contains(news)
    }
    func addLikedNews(news:NewsModel){
        SavedNews.append(news)
    }
 
    
    func removeLikedMeme(news: NewsModel) {
           if let index = SavedNews.firstIndex(of: news) {
               SavedNews.remove(at: index)
           }
       }
    func fetchData() {
        guard let url = URL(string: "https://gnews.io/api/v4/search?q=example&lang=en&country=us&max=10&apikey=c75f521daefa08a3f2e085dc309439b8") else {
            return
        }
        
      

        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.news = decodedData.articles
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [NewsModel]
}
