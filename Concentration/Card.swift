//
//  Card.swift
//  Concentration
//
//  Created by Mohsin Ali Ayub on 26.12.20.
//

import Foundation

struct Card: Hashable, Equatable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    // initializer
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    // methods
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // MARK:- Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
