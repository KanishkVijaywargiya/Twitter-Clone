//
//  ToastModifier.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 04/07/21.
//

import SwiftUI
enum ToastType: String, Equatable, CaseIterable {
    case scaleToast = "scaleToast"
    case offsetToast = "offsetToast"
}
struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    var title: String = ""
    var message: String
    var color: Color = Color.primary.opacity(0.5)
    var duration: Int = 2
    var alignment: VerticalAlignment = .bottom
    var toastType: ToastType = .scaleToast
    var image: Image?
    
    var scaleToast: some View {
        VStack {
            if alignment == .bottom {
                Spacer()
            }
            HStack(spacing: 15) {
                if image != nil {
                    image!
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading) {
                    if !title.isEmpty {
                        Text(title)
                            .toastStyle()
                            .font(.headline)
                    }
                    Text(message)
                        .toastStyle()
                        .font(.footnote)
                }
            }
            .toastContentModifier(bgColor: color)
            .opacity(isPresented ? 1 : 0)
            .scaleEffect(isPresented ? 1 : 0)
            .animation(Animation.easeOut)
            
            if alignment == .top {
                Spacer()
            }
        }
    }
    
    var offsetToast: some View {
        VStack {
            if alignment == .bottom {
                Spacer()
            }
            HStack(spacing: 15) {
                if image != nil {
                    image!
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                    
                    
                }
                VStack(alignment: .leading) {
                    if !title.isEmpty {
                        Text(title)
                            .toastStyle()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Text(message)
                        .toastStyle()
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
            .toastContentModifier(bgColor: color)
            .opacity(isPresented ? 1 : 0)
            .offset(x: 0, y: isPresented ? alignment == .bottom ? 0 : 0 : alignment == .bottom ? 70 : -100)
            .animation(Animation.easeOut)
            
            
            if alignment == .top {
                Spacer()
            }
        }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if toastType == .offsetToast {
                offsetToast
            } else {
                scaleToast
            }
        }
        .onChange(of: isPresented, perform: { value in
            if isPresented {
                toastTime()
            }
        })
    }
    
    
    func toastTime() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(duration + 1)) {
            withAnimation(Animation.easeOut) {
                isPresented.toggle()
            }
        }
    }
}
extension Text {
    func toastStyle(textAlignment: TextAlignment = .center) -> some View {
        self
            .multilineTextAlignment(textAlignment)
            .lineLimit(6)
            .foregroundColor(.white)
    }
}
struct ToastContentViewModifier: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(bgColor.shadow(radius: 10))
            .cornerRadius(30)
            .padding()
        
    }
}
extension View {
    func toastContentModifier(bgColor:Color) -> some View {
        self.modifier(ToastContentViewModifier(bgColor: bgColor))
    }
}
extension View {
    func showToast(_ message: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, color: Color) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color))
    }
    
    
    func showToast(_ message: String, isPresented: Binding<Bool>, duration: Int) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, color: Color, duration: Int) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, alignment: VerticalAlignment) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, alignment: alignment))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, color: Color, duration: Int, alignment: VerticalAlignment) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, duration: duration, alignment: alignment))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, color: Color, duration: Int, alignment: VerticalAlignment, toastType: ToastType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, duration: duration, alignment: alignment, toastType: toastType))
    }
    
    func showToast(_ message: String, isPresented: Binding<Bool>, color: Color, alignment: VerticalAlignment) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, alignment: alignment))
    }
    
    func showToastWithTitle(title: String, message: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message))
    }
    
    func showToastWithTitle(title: String, message: String, isPresented: Binding<Bool>, color: Color, toastType: ToastType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message, color: color, toastType: toastType))
    }
    
    func showToastWithTitleAndImage(title: String, message: String, image: Image, isPresented: Binding<Bool>) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message, image: image))
    }
    
    func showToastWithTitleAndImage(title: String, message: String, image: Image, isPresented: Binding<Bool>, color: Color) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message, color: color, image: image))
    }
    
    func showToastWithTitleAndImage(title: String, message: String, image: Image, isPresented: Binding<Bool>, color: Color, toastType: ToastType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message, color: color, toastType: toastType, image: image))
    }
    
    func showToastWithTitleAndImage(title: String, message: String, image: Image?, isPresented: Binding<Bool>, color: Color, duration: Int, toastType: ToastType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, title: title, message: message, color: color, duration: duration, toastType: toastType, image: image))
    }
    
    func showToastWithImage(_ message: String, image: Image, isPresented: Binding<Bool>) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, image: image))
    }
    
    func showToastWithImage(_ message: String, image: Image, isPresented: Binding<Bool>, color: Color) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, image: image))
    }
    
    func showToastWithImage(_ message: String, image: Image, isPresented: Binding<Bool>, color: Color, duration: Int) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, duration: duration, image: image))
    }
    
    func showToastWithImage(_ message: String, image: Image, isPresented: Binding<Bool>, color: Color, duration: Int, toastType: ToastType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, color: color, duration: duration, toastType: toastType, image: image))
    }
}

