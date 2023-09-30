//
//  Item.swift
//  brainfm-improved
//
//  Created by Baiel Kulikovsky on 30/9/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
