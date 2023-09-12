import UIKit

func binarySearch(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while(start <= end){
        let mid = start + (end - start)/2
        
        if (arr[mid] == target){
            return mid
        }
        else if (arr[mid] < target){
            start = mid + 1
        }
        else {
            end = mid - 1
        }
    }
    
    return -1
}

let arr = [2, 3, 4, 6, 7, 8, 10]
let target = 7
let result = binarySearch(arr: arr, target: target)

print("IDX: \(result)")
