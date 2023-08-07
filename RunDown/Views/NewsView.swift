import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        VStack {
            Text("Trending").font(.largeTitle).bold()
            List(viewModel.news, id: \.title) { news in
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.headline)
                    
                    Spacer().frame(height: 10)
                    
                    
                    Text(news.description)
                        .font(.subheadline)
                    Image(systemName: "heart")
                        .foregroundColor(.accentColor)
                        .padding()
                        .onTapGesture {
                            if viewModel.isNewsLiked(news: news) {
                                                           viewModel.removeLikedMeme(news: news)
                                                       } else {
                                                           viewModel.addLikedNews(news: news)
                                                       }
                            print(viewModel.$SavedNews)
                        }
                    Spacer()
                    
                }
                
                
                
            }.padding()
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

