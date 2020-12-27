//
//  Card.swift
//  Concentration
//
//  Created by Mohsin Ali Ayub on 26.12.20.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    // initializer
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    // methods
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
