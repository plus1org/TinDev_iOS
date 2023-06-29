//
//  KeyboardModifier.swift
//  
//

import SwiftUI
import Combine

struct HideKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
            }
    }
}

extension View {
    func hideKeyboard() -> some View {
        modifier(HideKeyboard())
    }
}

struct KeyboardAvoidingView: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, max(0, keyboardHeight - 23))
            .onReceive(keyboardHeightPublisher) { height in
                withAnimation {
                    self.keyboardHeight = height
                }
            }
    }
}

extension View {
    func keyboardAvoiding() -> some View {
        return modifier(KeyboardAvoidingView())
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
    let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
        .map { $0.keyboardHeight }
    
    let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
        .map { _ in CGFloat(0) }
    
    return Publishers.Merge(willShow, willHide)
        .eraseToAnyPublisher()
}
