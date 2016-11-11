//: [Previous](@previous)
/*:
 `map`, `filter` and `reduce` are the most important building blocks in functional programming. In essence, all of them are abstractions over common operations on collections (e.g. arrays):
 
 1. `map` will take each element of a collection and _transform_ it to something else
 2. `filter` will _remove_ certain elements from an array that don't adhere to a given condition
 3. `reduce` _combines_ all the elements of an array and outputs a single value
 
 On this playground page, we will implement our own versions of these functions.
 
 ### Challenges
 
 Write the following functions:
 
 1. `func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]` that applies the `transform` closure on each element in the input `array`
 2. `func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]` that applies the `transform` closure on each element in the input `array`
 3. `func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 4. `func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 5. `func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int` that reduces all the elements in the input `array` to one single output element of type `Int` by applying the `combine` function to each intermediate result and the current value in the input `array`
 6. `func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`
 7. `func map<T, U>(array: [T], transform: (T) -> U) -> [U]` that applies the `transform` closure on each element in the input `array`
 8. `func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 9. `func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U`
 10. recursive versions of `map`, `filter` and `reduce` 😏
 */



//: [Previous](@previous)
/*:
 `map`, `filter` and `reduce` are the most important building blocks in functional programming. In essence, all of them are abstractions over common operations on collections (e.g. arrays):
 
 1. `map` will take each element of a collection and _transform_ it to something else
 2. `filter` will _remove_ certain elements from an array that don't adhere to a given condition
 3. `reduce` _combines_ all the elements of an array and outputs a single value
 
 On this playground page, we will implement our own versions of these functions.
 
 ### Challenges
 
 Write the following functions:
 
 1. `func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]` that applies the `transform` closure on each element in the input `array`
 2. `func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]` that applies the `transform` closure on each element in the input `array`
 3. `func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 4. `func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 5. `func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int` that reduces all the elements in the input `array` to one single output element of type `Int` by applying the `combine` function to each intermediate result and the current value in the input `array`
 6. `func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`
 7. `func map<T, U>(array: [T], transform: (T) -> U) -> [U]` that applies the `transform` closure on each element in the input `array`
 8. `func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 9. `func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U`
 10. recursive versions of `map`, `filter` and `reduce` 😏
 */


// FIRST

let array = [1,2,3,4,5,6,7,8]
let stringArray = ["apple", "bapple", "capple", "sap", "lap"]

func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]{
    return array.map(transform)
}

mapIntsToInts(array: array, transform: {$0*2})

// SECOND

func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]{
    return array.map(transform)
}

mapIntsToStrings(array: array, transform: {String($0)})

// THIRD

func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int] {
    return filterInts(array: array, isIncluded: isIncluded)
}

filterInts(array: array, isIncluded: {$0 % 2 == 0})

func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String] {
    return array.filter(isIncluded)
}

filterStrings(array:stringArray, isIncluded: {$0.characters.count == 5})



func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int {
    return array.reduce(initial, combine)

    }

reduceIntsToInt(array: array, initial: 0, combine: +)


func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String{
    return array.reduce(initial, combine)
}

reduceStringsToStrings(array: stringArray, initial: "", combine: +) // OR { $0 + $1}





func map<T, U>(array: [T], transform: (T) -> U) -> [U]{
    var output:[U] = []
    for item in array{
        output.append(transform(item))
    }
    return output
}


func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]{
    var output:[T] = []
    for item in array{
        if isIncluded(item){
            output.append(item)
        }
    }
    return output
}


func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U{
    var first = initial
    for item in array{
        first = combine (first, item)
    }
    return first
}

func recurse(array:[Int], count: Int, function: (Int) -> Int) -> [Int]{
    var output:[Int] = array
    if count < array.count{
        output[count] = function(output[count])
        let newCount = count + 1
        return recurse(array: output, count: newCount, function: function)
    }
    else{
        return output
    }
}

func multiply(a:Int, b:Int) -> Int{
    return a*b
}

//recurse(array: array, count: 0, function: {$0 * 2})










