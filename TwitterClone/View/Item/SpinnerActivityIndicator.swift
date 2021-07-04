//
//  SpinnerActivityIndicator.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 04/07/21.
//

import SwiftUI

struct SpinnerActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        self.shouldAnimate ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
