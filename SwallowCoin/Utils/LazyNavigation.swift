//
//  LazyNavigation.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 07/11/2023.
//

import SwiftUI

struct LazyNavigation<Content: View>: View {
    var build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
