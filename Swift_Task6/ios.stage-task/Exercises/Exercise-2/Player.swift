//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        for itemCard in hand!{
                  if card.value == itemCard.value{
                      return true
                  }
              }
              return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for (cardFirst, cardSecond) in table {
                   if checkIfCanTossWhenAttacking(card: cardFirst) {
                       return true
                   } else if checkIfCanTossWhenAttacking(card: cardSecond) {
                    return true

                   }
               }
               return false
    }
}
