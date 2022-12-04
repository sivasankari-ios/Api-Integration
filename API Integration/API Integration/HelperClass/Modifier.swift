//
//  Modifier.swift
//  API Integration
//
//  Created by Abilash  MacBook on 03/12/22.
//

import Foundation
import SwiftUI

struct PopupView<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool
    let alignment: Alignment
    init(isPresented: Bool, alignment: Alignment, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment
        popup = content()
    }
    var body: some View {
        Preview()
    }
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
        
        
    }
}
struct Preview: View {
    @State var isPresented = false
    var body: some View {
        ZStack {
            VStack {
                Button("Toggle", action: { isPresented.toggle() })
                Spacer()
            }
            .modifier(PopupView(isPresented: isPresented,
                                alignment: .center,
                                content: {
                EmptyView()
                    .frame(width: UIScreen.main.bounds.width,  alignment: .bottom)
                    .cornerRadius(10)
            }))
        }
    }
}
