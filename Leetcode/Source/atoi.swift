import Cocoa

class atoiSolution {
    class func myAtoi(_ str: String) -> Int {
        
        var number: Int = 0
        var signMultiplier = 1
        var hasFirstDigitOrSIgn = false
        
        for char in str {
            if char.isNumber {
                hasFirstDigitOrSIgn = true
                number = number &* 10 &+ Int(char.wholeNumberValue!)
            } else if char.isWhitespace && hasFirstDigitOrSIgn {
                break
            } else if char.isLetter {
                break
            } else if number == 0, char == "-" {
                if hasFirstDigitOrSIgn {
                    break
                }
                hasFirstDigitOrSIgn = true
                signMultiplier = -1
            } else if char == "+" {
                if hasFirstDigitOrSIgn {
                    break
                }
                hasFirstDigitOrSIgn = true
            } else if char == "." {
                break
            }
        }
        
        if number < Int(Int32.min) {
            return signMultiplier == 1 ? Int(Int32.max) : Int(Int32.min)
        }
        return number > Int32.max ? Int(signMultiplier == -1 ? Int32.min : Int32.max) : Int(number) * signMultiplier
    }
    
    class func test() {
//        let value: Int = 20000000000000000000
        
        print(myAtoi("18446744073709551619"))
    }
}
