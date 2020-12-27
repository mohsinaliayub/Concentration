//
//  Concentration.swift
//  Concentration
//
//  Created by Mohsin Ali Ayub on 26.12.20.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    // this variable holds an index of only one card that the user has chosen
    // if user has not chosen anything or more than one cards, it is nil
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // MARK:- initializers
    
    init(numberOfPairsOfCards: Int) {
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
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            // one card is already faced up, and we are taking its index from indexOfOneAndOnlyFaceUpCard
            // Also, we are making sure user has selected two different cards from array
            // If both cards are at different indices in an array, then check if their identifier is same
            //     - If both are same, then set their isMatched property to true
            // Putting both the cards upwards and setting nil to our index holder variable
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no card or 2 cards are face up
                // face down all the cards, set the new card that the user selected to face up
                // and save its index
                for flipDownCardIndex in cards.indices {
                    cards[flipDownCardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
