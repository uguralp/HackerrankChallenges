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
