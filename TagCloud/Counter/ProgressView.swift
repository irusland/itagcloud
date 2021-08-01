//
//  SwiftUIView.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 18.07.2021.
//

import SwiftUI

struct ProgressControlView: View {
    @State private var progress = 0.5
    
    var body: some View {
        ProgressView(value: progress)
        Button("More", action: { progress += 0.05 })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressControlView()
    }
}
