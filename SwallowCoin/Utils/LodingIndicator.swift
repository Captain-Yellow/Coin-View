//
//  LodingIndicator.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 06/11/2023.
//

import SwiftUI

struct LodingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(x: 2, y: 2, anchor: .center)
            .tint(.gray)
            .frame(width: 200, height: 200, alignment: .center)
            .background(Color(UIColor.systemGray6))
            .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    LodingIndicator()
}
