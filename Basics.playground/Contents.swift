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

func mergeSort(arr: inout [Int], low: Int, high: Int){
    if (low < high){
        let mid = (low + high)/2
        mergeSort(arr: &arr, low: low, high: mid)
        mergeSort(arr: &arr, low: mid + 1, high: high)
        merge(arr: &arr, low: low, mid: mid, high: high)
    }
}

func merge(arr: inout [Int], low: Int, mid: Int, high: Int){
    let n1 = mid - low + 1
    let n2 = high - mid
    
    var left: [Int] = Array(repeating: 0, count: n1)
    var right: [Int] = Array(repeating: 0, count: n2)
    
    for i in 0..<n1 {
        left[i] = arr[low + i]
    }
    
    for j in 0..<n2 {
        right[j] = arr[mid + 1 + j]
    }
    
    var i = 0
    var j = 0
    var k = low
    
    while(i < n1 && j < n2){
        if(left[i] <= right[j]){
            arr[k] = left[i]
            i += 1
        }else{
            arr[k] = right[j]
            j += 1
        }
        k += 1
    }
    
    while(i < n1){
        arr[k] = left[i]
        i += 1
        k += 1
    }
    
    while(j < n2){
        arr[k] = right[j]
        j += 1
        k += 1
    }
}

func measureElapsedTime(_ operation: () throws -> Void) throws -> UInt64 {
    let startTime = DispatchTime.now()
    try operation()
    let endTime = DispatchTime.now()

    let elapsedTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let elapsedTimeInMilliSeconds = Double(elapsedTime) / 1_000_000.0

    return UInt64(elapsedTimeInMilliSeconds)
}


var arr = [2, 3, 4, 6, 7, 8, 10]
let target = 7
let result = binarySearch(arr: arr, target: target)

var array = Array(0...200)
array.shuffle()
let elapsedTime = try measureElapsedTime{mergeSort(arr: &array, low: 0, high: array.count - 1)}
print("EXECUTION-TIME: \(elapsedTime)")
