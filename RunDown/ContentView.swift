//
//  ContentView.swift
//  RunDown
//
//  Created by Desi Rorie on 8/5/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding:Bool?
    @State var opacityState:Bool = false
    var body: some View {
        VStack {
            Text("Rundown").font(.largeTitle)
                .opacity(opacityState ? 1 : 0)
                .animation(.easeOut(duration: 2), value: opacityState)
        }
        .onAppear{
            Task{
                withAnimation {
                    opacityState = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        isOnboarding = false
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
