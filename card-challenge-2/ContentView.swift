//
//  ContentView.swift
//  card-challenge-2
//
//  Created by Kyle Sherrington on 2021-01-26.
//

import SwiftUI

struct Card {
    var number = 1
    var suit = 0
}

struct ContentView: View {
    
    @State var deck = [Card]()
    @State var message = ""
    @State var generatedLog = [String]()
    var suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
    
    var body: some View {
        VStack (spacing: 10.0) {
            Text(message)
            HStack (spacing: 10.0) {
                Button("Add Card") {
                    addCard()
                }
                Button("Draw Card") {
                    drawCard()
                }
            }
        }
    }
    
    func addCard() {
        let randNum = Int.random(in: 1...13)
        let randSuit = Int.random(in: 0...3)
        
        var newCard = Card()
        newCard.number = randNum
        newCard.suit = randSuit
        
        let numberSuitString = String(newCard.number) + "/" + String(newCard.suit)
        
        if generatedLog.contains(numberSuitString) {
            message = "Generated duplicate card"
        }
        else {
            deck.append(newCard)
            generatedLog.append(numberSuitString)
            
            let suitName = suits[newCard.suit]
            let cardName = getCardName(newCard.number)
            
            message = "Generated a \(cardName) of \(suitName)"
        }
    }
    
    
    func drawCard() {
        if deck.count == 0 {
            message = "No cards in the deck"
        }
        else {
            let randIndex = Int.random(in: 0...deck.count-1)
//            let randomCard = deck.randomElement()
            let randomCard = deck[randIndex]
            
            let cardName = getCardName(randomCard.number)
            let suitName = suits[randomCard.suit]
            
            message = "Drew a \(cardName) of \(suitName)"
        }
    }
    
    
    func getCardName(_ cardNumber:Int) -> String {
        if cardNumber == 1 {
            return "Ace"
        }
        else if cardNumber == 11 {
            return "Jack"
        }
        else if cardNumber == 12 {
            return "Queen"
        }
        else if cardNumber == 13 {
            return "King"
        }
        else {
            return String(cardNumber)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
