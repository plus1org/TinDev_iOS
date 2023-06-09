//
//  TabBar.swift
//  TinDev
//
//  Created by M on 28.06.2023.
//

import SwiftUI

struct ProfileTabView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text(Localizable.LoginModule.loginTitle)
        }
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            SearchScreenView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(Localizable.TabBar.search)
                }
            AllChatsScreenView()
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
