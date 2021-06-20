//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        
        var attackPlayer = Player()
        var minValue = 9
              
              for player in players{
                  for item in 0..<6{
                      if player.hand?[item].isTrump == true{
                          let cardValue = Value.allCases.firstIndex(where: {$0 == player.hand?[item].value})!
                          if cardValue < minValue {
                            attackPlayer = player
                              minValue = cardValue
                          }
                      }
                  }
              }
              
              return attackPlayer
    }
}
