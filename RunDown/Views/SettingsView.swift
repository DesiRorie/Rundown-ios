//
//  SettingsView.swift
//  RunDown
//
//  Created by Desi Rorie on 8/6/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") var isDarkMode:Bool = false
    var apiDocumentation = URL(string: "https://gnews.io/docs/v4#introduction")

    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Display"), footer: Text("Display settings will override system settings.")){
                    
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                
                Section(header:Text("About")){
                    VStack(alignment: .leading){
                        Image("runDown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)

                        Text("This app was made to make receiving important news easy but efficient to receive.")
                        
                        if let url = apiDocumentation {
                            Link("Check API documentation", destination: url).padding(.vertical)
                        }
                    }
                }
               
            }.navigationTitle("Settings ")
                .accentColor(.blue)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
