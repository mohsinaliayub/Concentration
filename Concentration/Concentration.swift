//
//  Concentration.swift
//  Concentration
//
//  Created by Mohsin Ali Ayub on 26.12.20.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    // this variable holds an index of only one card that the user has chosen
    // if user has not chosen anything or more than one cards, it is nil
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // MARK:- initializers
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        // create two same cards and put them into an array
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: shuffle the cards
        cards.shuffle()
    }
    
    // MARK:- Methods
    
    // this function performs the entirety of our game logic
    // When user taps a card, the following should happen:
    //      1) if there is no card faced up, set the current card to face up
    //      2) if there is already a single card with same identifier faced up, match them
    //      3) if there are 2 cards already faced up, face them down and set current card to face up
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            // one card is already faced up, and we are taking its index from indexOfOneAndOnlyFaceUpCard
            // Also, we are making sure user has selected two different cards from array
            // If both cards are at different indices in an array, then check if their identifier is same
            //     - If both are same, then set their isMatched property to true
            // Putting both the cards upwards and setting nil to our index holder variable
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no card or 2 cards are face up
                // face down all the cards, set the new card that the user selected to face up
                // and save its index... This functionality is moved to indexOfOneAndOnlyFaceUpCard property
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
