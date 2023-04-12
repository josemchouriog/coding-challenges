
func smallestPositiveInteger(_ array: inout [Int]) -> Int {
    var currentIndex = 0

    while(currentIndex < array.count) {
        if array[currentIndex] >= 1 && array[currentIndex] <= array.count  && array[array[currentIndex] - 1] != array[currentIndex] {
            array.swapAt(currentIndex, array[currentIndex] - 1)
        } else {
            currentIndex += 1
        }
    }

    for index in array.indices {
        if array[index] != index + 1 {
            return index + 1
        }
    }

    return array.count + 1
}

/*var initialArray = [Int]()*/
var initialArray = [1,1,1,1,1,1,1,-2,-1,0,23,2]
print(smallestPositiveInteger(&initialArray))
