//
//  MultilineTextField.swift
//

import SwiftUI

struct MultilineTextField: View {
    let headerText: String
    @State var text: String
    let placeholder: String
    let textForegroundColor: Color
    @State private var isEditing = false
    @State private var height: CGFloat = 50
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .foregroundColor(textForegroundColor)
                .font(Fonts.regular15)
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing ? Pallete.customBlack : Pallete.customGray, lineWidth: 2)
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .font(Fonts.regular15)
                        .padding()
                }
                
                MultilineTextView(text: $text, height: $height, isEditing: $isEditing)
                    .padding(.horizontal)
            }
            .frame(height: height)
        }
        .onReceive(NotificationCenter.default.publisher(for: UITextView.textDidChangeNotification)) { _ in
            withAnimation {
                self.height = textHeight()
            }
        }
    }
    
    private func textHeight() -> CGFloat {
        let uiTextView = UITextView()
        uiTextView.text = text
        uiTextView.font = .systemFont(ofSize: 15)
        uiTextView.textContainerInset = UIEdgeInsets(top: 16, left: -3, bottom: 16, right: 0)
        let width = uiTextView.sizeThatFits(CGSize(width: uiTextView.frame.size.width,
                                                   height: CGFloat.greatestFiniteMagnitude)).height
        return max(50, width)
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    @Binding var isEditing: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = false
        textView.text = text
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 15)
        textView.textContainerInset = UIEdgeInsets(top: 16, left: -3, bottom: 16, right: 0)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextView
        
        init(_ parent: MultilineTextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            parent.isEditing = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            parent.isEditing = false
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct MultilineTextField_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextField(
            headerText: "Пример",
            text: "",
            placeholder: "Введите текст...",
            textForegroundColor: .black
        )
        .padding()
    }
}
