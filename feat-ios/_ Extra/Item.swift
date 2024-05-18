//
//  Item.swift
//  feat-ios
//
//  Created by Soheil Novinfard on 18/05/2024.
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
