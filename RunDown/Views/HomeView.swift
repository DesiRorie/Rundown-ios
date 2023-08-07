//
//  HomeView.swift
//  RunDown
//
//  Created by Desi Rorie on 8/6/23.
//

import SwiftUI

struct HomeView: View {
    @State var greeting:String = ""
    @State  var isGreeting:Bool = false
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        var greeting:String = ""
        dateFormatter.dateFormat = "HH"
        let militaryTime = Int(dateFormatter.string(from: Date())) ?? 0
        if (militaryTime < 12){
            greeting = "Good Morning"
        }
        else if(militaryTime > 12 && militaryTime < 17){
            greeting = "Good Afternoon"
        }
        else{
            greeting = "Good Evening"
        }
            return greeting
        
    }
    
    @State var selection:Int = 0
    var body: some View {
        VStack {
            HStack {
                isGreeting ? Text("\(getTime())").bold() :Text("")
                Spacer()
            }.padding(.horizontal,20)
            TabView(selection: $selection) {
                NewsView()
                    .tag(1)
                    .tabItem {
                        Label("Trending", systemImage: "flame.fill")
                    }
                AllNewsView()
                    .onAppear{
                        withAnimation {
                            isGreeting = true
                        }
                    }
                    .onDisappear{
                        withAnimation {
                            isGreeting =  false
                        }
                    }
                    .tabItem {
                        Label("News", systemImage: "newspaper.fill")
                    }.tag(0)
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }.tag(2)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }.tag(3)
             
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
