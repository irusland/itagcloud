//
//  ContentView.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 18.07.2021.
//

import SwiftUI


struct ContentView: View {
    @State var environment: EnvironmentUIView

    
    var body: some View {

        environment
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(environment: EnvironmentUIView())
    }
}
