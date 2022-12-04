//
//  CustomScrollView.swift
//  API Integration
//
//  Created by Abilash  MacBook on 02/12/22.
//

import SwiftUI
private struct ScrollOffsetPreferenceKey1: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
struct CustomScrollView<Content: View>: View {
    
    let axes: Axis.Set
    let showsIndicators: Bool
    let offsetChanged: (CGPoint) -> Void
    let content: Content

    init(
        axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        offsetChanged: @escaping (CGPoint) -> Void = { _ in },
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    var body: some View {
         SwiftUI.ScrollView(axes, showsIndicators: showsIndicators) {
             GeometryReader { geometry in
                 Color.clear.preference(
                     key: ScrollOffsetPreferenceKey1.self,
                     value: geometry.frame(in: .named("scrollView")).origin
                 )
             }.frame(width: 0, height: 0)
             content
         }
         .coordinateSpace(name: "scrollView")
         .onPreferenceChange(ScrollOffsetPreferenceKey1.self, perform: offsetChanged)
     }
}

