//
//  ContentView.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            GameList()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Games")
                    }
                }
                .tag(0)
            Text("Settings")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Settings")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
