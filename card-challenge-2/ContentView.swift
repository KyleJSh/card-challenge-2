//
//  ContentView.swift
//  card-challenge-2
//
//  Created by Kyle Sherrington on 2021-01-26.
//

import SwiftUI

struct Card {
    var card = 1
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
        newCard.card = randNum
        newCard.suit = randSuit
    }
    
    func drawCard() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
