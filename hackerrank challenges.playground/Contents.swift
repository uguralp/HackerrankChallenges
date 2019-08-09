import Foundation

//Compare Triplets
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var result = [Int]()
    var ra = 0
    var rb = 0
    for i in 0...a.count-1{
        if a[i]>b[i]{
            ra += 1
        }else if a[i]<b[i]{
            rb += 1
        }
    }
    
    result.append(ra)
    result.append(rb)
    return result
}

var r = compareTriplets(a: [0,2,4], b: [5,7,2])
print(r)

//hash tables ransom note
func checkMagazine(magazine: [String], note: [String]) -> Void {
    let magazineWords = NSCountedSet(array: magazine)
    let noteWords = NSCountedSet(array: note)
    
    for noteWord in noteWords {
        if magazineWords.count(for: noteWord) < noteWords.count(for: noteWord) {
            return print("No")
        }
    }
    return print("Yes")
}

//Diagonal difference
func diagonalDifference(arr: [[Int]]) -> Int {
    var primaryDiagonalSum = 0, secondaryDiagonalSum = 0
    for index in 0..<arr.count {
        primaryDiagonalSum = primaryDiagonalSum + arr[index][index]
        secondaryDiagonalSum = secondaryDiagonalSum + arr[index][arr.count-index-1]
    }
    
    return abs(primaryDiagonalSum - secondaryDiagonalSum)
}


//staircase problem
func staircase(n: Int) -> Void {
    let hash = "#"
    for i in 1...n{
        let spaces = String(repeating: " ", count: n - i)
        let prntHash = String(repeating: hash, count: i)
        print(spaces + prntHash)
    }
    
}

staircase(n: 6)

//Given an array of integers, calculate the fractions of its elements that are positive, negative, and are zeros. Print the decimal value of each fraction on a new line.
func plusMinus(arr: [Int]) -> Void {
 var posCount = 0, negCount = 0, zeroCount = 0
    
    for i in 0...arr.count-1{
        if arr[i].signum() == 1{
            posCount += 1
        }else if arr[i].signum() == -1{
            negCount += 1
        }else if arr[i].signum() == 0{
            zeroCount += 1
        }

    }
    
    let r1 = Float(exactly:(Float(posCount)/Float(arr.count)))
    let r2 = Float(exactly:(Float(negCount)/Float(arr.count)))
    let r3 = Float(exactly:(Float(zeroCount)/Float(arr.count)))

    print(r1!)
    print(r2!)
    print(r3!)
}

plusMinus(arr: [-4,3, -9, 0, 4, 1])


func miniMaxSum( arr: [Int]) -> Void {
    let max = arr.max()
    let min = arr.min()
    
    var minRepeat = false
    var maxRepeat = false
    
    var minSum = 0
    var maxSum = 0
    
    for i in 0...arr.count-1{
        if arr[i] == max && maxRepeat == false{
            maxRepeat = true
        }else{
            maxSum += arr[i]
        }
    }

    for i in 0...arr.count-1{
        if arr[i] == min && minRepeat == false {
            minRepeat = true
        }else{
            minSum += arr[i]
        }
    }
    print(maxSum, minSum)
}

miniMaxSum(arr: [1,2,3,4,5])


//Camel case problem
func camelcase(s: String) -> Int {
    
    let splittedStrArray = s.components(separatedBy: CharacterSet(charactersIn: "A"..."Z"))
    return splittedStrArray.count
}

var deneme = "dsadAsdasdRsdsadOadkaslşdWsdsadRsdasda"

print(camelcase(s: deneme))

//grading students
func gradingStudents(grades: [Int]) -> [Int] {
    var result = [Int]()
    for all in grades{
        switch all % 5 {
        case 4:
            let roundedValue = all + 1
            if roundedValue < 40 {
                print("no change for \(roundedValue)")
                result.append(all)
            }else{
                result.append(roundedValue)
            }
        case 3:
            let roundedValue = all + 2
            if roundedValue < 40 {
                print("no change for \(roundedValue)")
                result.append(all)
            }else{
                result.append(roundedValue)
            }
        default:
            result.append(all)
        }
    }
    
    return result
}
let ok = [73, 67, 38, 33]
print(gradingStudents(grades: ok))


// Bon Appétit
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    var chargedBill = bill
    var sharedBill = [Int]()
    var total = 0
    var actualBill = 0
    var itemFound = false
    
    for all in chargedBill{
        
        if all == bill[k]{
            if itemFound == false{
                chargedBill.remove(at: k)
                itemFound = true
            }else{
                sharedBill.append(all)
                total += all
            }
        }else{
            sharedBill.append(all)
            total += all
        }
    }
    
    actualBill = total / 2
    
    if actualBill == b{
        print("Bon Appetit")
    }else{
        print(b - actualBill)
    }
}

let bill = [3, 10, 2, 9]
bonAppetit(bill: bill, k: 1, b: 12)

//Arrays: Left Rotation
func rotLeft(a: [Int], d: Int) -> [Int] {
    var arr = a
    let size = arr.count - 1
    for i in 0...size  {
        let newloc = (i + (arr.count - d)) % arr.count
        arr[newloc] = a[i]
    }
    return arr
    
}

var rotateLeft = rotLeft(a: [1, 2, 3, 4, 5], d: 3)
print(rotateLeft)

// Caesar Cipher: Encryption
func caesarCipher(s: String, k: Int) -> String{
    let range = UInt8(ascii: "a")...UInt8(ascii: "z")
    let rangeUppercased = UInt8(ascii: "A")...UInt8(ascii: "Z") // CountableClosedRange<UInt8>
    // Convert ASCII codes into Character values
    let alphabet = range.map { Character(UnicodeScalar($0)) } // Array<Character>
    var uppercasedAlphabet = rangeUppercased.map { Character(UnicodeScalar($0)) }
    
    var result = String()
    var arrayString = Array(s)
    var indexes = [Int]()
    var key = k
    
    if key > alphabet.count{
        repeat{
            key = key - alphabet.count
        }while key >= alphabet.count
    }
    
    for i in 0...arrayString.count-1{
        
        if uppercasedAlphabet.contains(arrayString[i]){
            indexes.append(uppercasedAlphabet.firstIndex(of: arrayString[i])!)
        }else{
            let letters = CharacterSet.letters
            let range = String(arrayString[i]).rangeOfCharacter(from: letters)
            
            if range == nil{
                indexes.append(100)
            }else{
                indexes.append(alphabet.firstIndex(of: arrayString[i])!)
            }
        }
        
    }
    
    for i in 0...arrayString.count-1{
        let letters = CharacterSet.letters
        let range = String(arrayString[i]).rangeOfCharacter(from: letters)
        
        if range == nil{
            result += String(arrayString[i])
        }else{
            if uppercasedAlphabet.contains(arrayString[i]){
                if key + indexes[i] > uppercasedAlphabet.count || key + indexes[i] == uppercasedAlphabet.count {
                    var number = 0
                    number = key - ((alphabet.count-1)-indexes[i])
                    arrayString[i] = uppercasedAlphabet[number-1]
                    result += String(arrayString[i])
                } else{
                    arrayString[i] = uppercasedAlphabet[key + indexes[i]]
                    result += String(arrayString[i])
                }
            }else{
                if key + indexes[i] > alphabet.count || key + indexes[i] == alphabet.count {
                    var number = 0
                    number = key - ((alphabet.count-1)-indexes[i])
                    arrayString[i] = alphabet[number-1]
                    result += String(arrayString[i])
                } else{
                    arrayString[i] = alphabet[key + indexes[i]]
                    result += String(arrayString[i])
                }
            }
            
        }
    }
    return result
}

var alaq = "www.abc.xy"

print(caesarCipher(s: alaq, k: 87))

//Time Conversion
func timeConversion(s: String) -> String {
    let dateAsString = s
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm:ssa"
    let date = dateFormatter.date(from: dateAsString)
    
    dateFormatter.dateFormat = "HH:mm:ss"
    let date24 = dateFormatter.string(from: date!)
    
    return date24
    
}
var tc = timeConversion(s: "07:05:45PM")
print(tc)
