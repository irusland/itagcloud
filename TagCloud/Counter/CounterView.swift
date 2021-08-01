//
//  ContentView.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 18.07.2021.
//

import SwiftUI


struct CounterView: View {
    @State var counter: Counter
    @State var counterText: String = ""
    @State var increment: Int = 0
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            VStack(alignment: .center){
                Text(counterText)
                    .padding()
                Button(action: {
                    self.counter.increment()
                    counterText = self.counter.getValue()
                }, label: {
                    Text("++")
                })
                
                HStack{
                    TextField("Increment", value: $increment, formatter: NumberFormatter())
                    Button(action: {
                        self.counter.increment(by: increment)
                        counterText = self.counter.getValue()
                        
                    }, label: {
                        Text("+\(increment)")
                    })
                    
                }
            }
            
        }
        EnvironmentUIView()
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(counter: Counter())
    }
}
