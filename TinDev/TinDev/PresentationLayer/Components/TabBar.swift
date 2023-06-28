//
//  TabBar.swift
//  TinDev
//
//  Created by M on 28.06.2023.
//

import SwiftUI


struct SearchTabView: View {
    var body: some View {
        Text("Tab 1")
    }
}

struct ChatTabView: View {
    var body: some View {
        Text("Tab 2")
    }
}

struct ProfileTabView: View {
    var body: some View {
        Text("Tab 3")
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            SearchTabView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(Localizable.TabBar.search)
                }
            
            ChatTabView()
                .tabItem {
                    Image(systemName: "message")
                    Text(Localizable.TabBar.chat)
                }
            
            ProfileTabView()
                .tabItem {
                    Image(systemName: "person")
                    Text(Localizable.TabBar.profile)
                
                }
        }.accentColor(Pallete.mainColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

