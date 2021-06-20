import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: Suit.allCases , values: Value.allCases)
    }


    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {

        var createdCards: [Card] = []

        for suit in suits{
            for value in values {
                createdCards.append(Card(suit: suit, value: value))
            }
        }

     return  createdCards

    }



    public mutating func shuffle() {
        if cards.count <= 0{return}

        for item in 0..<cards.count{

            let randomNumber = Int.random(in: 0..<cards.count)
             let tempValue = cards[randomNumber]
            cards[randomNumber] = cards[item]
            cards[item] = tempValue
        }

    }

    public mutating func defineTrump() {
        guard let trumpTemp = cards.first?.suit else {return}
        self.trump = trumpTemp
        setTrumpCards(for: trumpTemp)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if players.count <= 0 && players.count > 6{return}



        for player in players {
            var index = 6
            while index != 0 {
                if player.hand == nil{
                    player.hand = [Card]()
                }
                player.hand?.append(cards[index])
                cards.removeLast()
                index -= 1
            }
        }



    }


    public mutating func setTrumpCards(for suit:Suit) {

        for item in 0..<cards.count {
            if cards[item].suit == suit{
                cards[item].isTrump = true
            }

        }
    }
}




