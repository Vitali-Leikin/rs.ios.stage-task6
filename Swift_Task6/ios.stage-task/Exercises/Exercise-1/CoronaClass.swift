import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        
        var minSeats = 0
        var maxSeats = -1
        var variantSeat = 0
        
        if seats.isEmpty {
            seats.append(0)
            return minSeats
        }
        
        
        for item in 0..<seats.count - 1{
            
            variantSeat = (seats[item] + seats[item + 1]) / 2
            
            var tempMin = 0
            if variantSeat - seats[item] <= seats[item + 1] - variantSeat{
                tempMin = variantSeat - seats[item]
            }else{
                tempMin = seats[item + 1] - variantSeat
            }
            
            if tempMin > maxSeats{
                maxSeats = tempMin
                print(maxSeats)
                minSeats = variantSeat
                
            }
            
        }
        
        
        let tempVal = (n - 2) - seats[seats.count - 1]
        
        if tempVal  > maxSeats{
            maxSeats = tempVal
            minSeats = n - 1
            
        }
        
        seats.append(minSeats)
        seats.sort(by: <)
        
        return minSeats
    }
    
    
    func leave(_ p: Int) {
        
        guard let i = seats.firstIndex(of: p)  else { return}
        seats.remove(at: i)
    }
}
