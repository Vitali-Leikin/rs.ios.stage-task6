import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable, Equatable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable,CaseIterable,Equatable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.suit == rhs.suit && lhs.value == rhs.value
        
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        if self.suit == card.suit {
               if self.value.rawValue > card.value.rawValue {
                   return true
               } else {
                   return false
               }
           }
           if self.isTrump {
               return true
           }
           return false
    }

    func checkValue(card: Card) -> Bool {
        let values = Value.allCases
             let indexCard = values.firstIndex(where: {$0 == card.value})!
             let indexCardSelf = values.firstIndex(where: {$0 == self.value})!
             
             if indexCardSelf > indexCard {
                 return true
             }
             
             return false
    }
}
