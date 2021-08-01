//
//  EnvironmentUIView.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 01.08.2021.
//

import SwiftUI

struct EnvironmentUIView: View {
    @State private var isRepresented = false
    var body: some View {
        VStack{
            Button("SHOW") {
                self.isRepresented = true
            }
        }
        .sheet(isPresented: $isRepresented) {
            CloudViewController()
        }
    }
}

struct EnvironmentUIView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentUIView()
    }
}
