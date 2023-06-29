//
//  HideTabBarModifier.swift
//  TinDev
//
//  Created by mttm on 29.06.2023.
//

import SwiftUI

struct TabBarModifier {
    static func showTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = false
            }
        })
    }
    
    static func hideTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = true
            }
        })
    }
}

struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.showTabBar()
        }
    }
}

struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.hideTabBar()
        }
    }
}

extension UIApplication {
    var key: UIWindow? {
        self.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?
            .windows
            .filter({$0.isKeyWindow})
            .first
    }
 }

extension UIView {
    func allSubviews() -> [UIView] {
        var subs = self.subviews
        for subview in self.subviews {
            let rec = subview.allSubviews()
            subs.append(contentsOf: rec)
        }
        return subs
    }
}

extension View {
    func showTabBar() -> some View {
        return self.modifier(ShowTabBar())
    }

    func hideTabBar() -> some View {
        return self.modifier(HiddenTabBar())
    }
}
