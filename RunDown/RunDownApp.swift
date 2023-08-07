//
//  RunDownApp.swift
//  RunDown
//
//  Created by Desi Rorie on 8/5/23.
//

import SwiftUI

@main
struct RunDownApp: App {
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    @AppStorage("isDarkMode") var isDarkMode:Bool = false
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                ContentView()
                   
            }
            else {
                HomeView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            
        }
    }
}
