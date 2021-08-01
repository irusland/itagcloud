//
//  Counter.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 18.07.2021.
//

import Foundation
import SwiftUI

class Counter {
    private var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
    func getValue() -> String {
        return "Count: \(count)"
    }
}
