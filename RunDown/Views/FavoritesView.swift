//
//  FavoritesView.swift
//  RunDown
//
//  Created by Desi Rorie on 8/6/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = NewsViewModel()
    var body: some View {
        VStack {
            Text("Favorite").font(.largeTitle).bold()
                Spacer()
            List(viewModel.SavedNews, id: \.title) { savedNews in
                VStack(alignment: .leading) {
                    Text(savedNews.title)
                        .font(.headline)
                    
                    Spacer().frame(height: 10)
                    
                    
                    Text(savedNews.description)
                        .font(.subheadline)
                    Image(systemName: "heart")
                        .foregroundColor(.accentColor)
                        .padding()
                        .onTapGesture {
                            if viewModel.isNewsLiked(news: savedNews) {
                                                           viewModel.removeLikedMeme(news: savedNews)
                                                       } else {
                                                           viewModel.addLikedNews(news:savedNews)
                                                       }
                            print(viewModel.$SavedNews)
                        }
                    Spacer()
                    
                }
                

            }
                
                }
                }
                }
                
                struct FavoritesView_Previews: PreviewProvider {
                    static var previews: some View {
                        FavoritesView()
                    }
                }
