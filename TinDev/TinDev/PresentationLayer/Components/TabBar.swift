//
//  TabBar.swift
//  TinDev
//
//  Created by M on 28.06.2023.
//

import SwiftUI

struct SearchTabView: View {
        
    @State private var isCreateMeetScreenPresented = false
    @State private var isFiltersViewPresented = false
    @State private var isCategoryViewPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {self.isCreateMeetScreenPresented = true}) {
                Text(Localizable.CreateMeetModule.navTitle).font(Fonts.regular17)
            }
            .fullScreenCover(isPresented: $isCreateMeetScreenPresented) {
                CreateMeetScreenView()
            }
            
            Button(action: {self.isFiltersViewPresented = true}) {
                Text(Localizable.FiltersModule.navTitle).font(Fonts.regular17)
            }
            .fullScreenCover(isPresented: $isFiltersViewPresented) {
                FiltersView()
            }
            
            Button(action: {self.isCategoryViewPresented = true}) {
                Text(Localizable.CategoryModule.navTitle).font(Fonts.regular17)
            }
            .fullScreenCover(isPresented: $isCategoryViewPresented) {
                CategoryView()
            }
        }
    }
}

struct ChatTabView: View {
    var body: some View {
        AllChatsScreenView()
    }
}

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
