import UIKit

/*Write a method/function that takes in a non-empty array of distinct integers and an integer representing a target sum. If any two numbers in the input array sum up to the target sum, the method should return them in an array, in any order. If no two numbers sum up to the target sum, the method should return an empty array.
Note that the target sum has to be obtained by summing two different integers in the array; you can't add a single integer to itself in order to obtain the target sum.
You can assume that there will be at most one pair of numbers summing up to the target sum.*/


/*---------------------------------------------------------------*/
/* This is an optimal solution but favors better time complexity than space complexity since we create a Set to store the elements that we find as we iterate through the array. This can be solved also using a Dictionary var candidates[Int: Bool] instead of a Set but depends on the preference of the developer which implementation to use:
 O(n) time | O(n) space */
/*---------------------------------------------------------------*/
func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    var candidates = Set<Int>()

    for currentNumber in array {
        let candidate = targetSum - currentNumber

        if candidates.contains(candidate), candidate != currentNumber {
            return [candidate, currentNumber]
        }
        candidates.insert(currentNumber)
    }

    return []
}

/*---------------------------------------------------------------*/
/* This is an optimal solution but favors better space complexity than time complexity since we sort the array at the beginning and that in the worst case is O(nlog(n)). Since the array is sorted in place the space complexity is not increased, by the contrary if we had used the method sorted() that is not in place that would have increased the space complexity because we would need another array to store the new ordered one:
 O(nlog(n)) time | O(1) space */
/*---------------------------------------------------------------*/

/*func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    array.sort()

    var lowerBound = 0
    var upperBound = array.count - 1

    while(lowerBound < upperBound) {
        if array[lowerBound] + array[upperBound] == targetSum {
            return[array[lowerBound], array[upperBound]]
        } else if array[lowerBound] + array[upperBound] > targetSum {
            upperBound -= 1
        } else if array[lowerBound] + array[upperBound] < targetSum {
            lowerBound += 1
        }
    }

    return []
}*/

/*---------------------------------------------------------------*/
/* Brute force solution. This is the most suboptimal solution and it's complexity is the following:
 O(n2) (n to power of 2) time | O(1) space */
/*---------------------------------------------------------------*/

/*func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    for externalIndex in array.indices {
        var internalIndex = externalIndex + 1
        while(internalIndex < array.count) {
            if array[externalIndex] + array[internalIndex] == targetSum {
                return [array[internalIndex], array[externalIndex]]
            }
            internalIndex += 1
        }
    }
    return []
}*/

var array: [Int] = [-6,-1, 5, 4, 6, 7, 1000, -2]
let result = twoNumberSum(&array, -8)
print(result)
