//: Playground - noun: a place where people can play

import UIKit
/*
func converToDouble(input: String) -> Double? {
   if input.characters.contains(","){
       input.replacingOccurrences(of: ",", with: "")
    }
    if let num = Double(input){
        return num
    }else{
        return nil
    }
}

converToDouble(input: "123,")
*/

/*
//Protocol
protocol Building {
    func numberOfPeopleInside() -> Int
    
    var numberOfFloofs: Int {get}
    var yearBuilt: Int {get}
    
}

//Adoption to protocol Building
//When an Struc or class adopts a protocol it must conform by using the properties
struct OfiiceBuilding: Building {
    
    //conforming by using protocol properties
    func numberOfPeopleInside() -> Int{
        return 34
    }
    var numberOfFloofs: Int
    var yearBuilt: Int
    
    //the we can customise our specificity
    var numbersOfEmployees: Int
    var hasSnackRoom: Bool
}

*/

/*
func returnLongArray(inputArray: [String])-> String{
    var longestString = " "
    for array in inputArray {
        if array.characters.count > longestString.characters.count {
            longestString = array
            }
        }
    return longestString
}


func reverse(text: String)-> String{
    var newString = String(text.reversed())
    return newString
}

returnLongArray(inputArray: ["baby", "boy", "nephew"])
reverse(text: "good")

protocol StandardFamily {
    func createFamily()->String
    
    var mother: String {get}
    var father: String {get}
    
}

class MyFamily: StandardFamily{
    var daughter: String
    var brother: String
    
    func createFamily() -> String {
        self.brother = "Bobo"
        return brother
    }
    var mother: String = "Comfort"
    var father: String = "Labo"
}
*/

/*

//CLOSURE
let myClosure = {(name: String) -> String in
    return("hello \(name)")

}

var closure = myClosure("Mary")

closure

func runThis(closure: () -> ()){
    closure()
}

let newClosure = {
    print(42)
}

runThis(closure: newClosure)
*/





/*

// String to compress
let stringtoCompress = "AAABBACC"

// Empty string to store compressed value
var compressedString = ""

// Store the letter count to append in compressed string
var letterCountStored:Int

//Initially letterCountStored is set to 0
letterCountStored = 0

// function the compress given string
func compressString(string2Compress: String) ->(String) {
    
    // get string length
    let letterCount = string2Compress.count
    
    // convert to int
    let letterCountInt = Int(letterCount)
    
    // check if string has more than 1 letter
    if letterCountInt == 1 {
        compressedString = string2Compress
    } else {
        //reduce 1 from characters count
        let stringlenth = letterCountInt-1
        
        //check all letters in string
        for i in 0 ..< stringlenth {
            // fetching first letter to compare
            let index = string2Compress.index(string2Compress.startIndex,offsetBy:i)
            let firstLetterToCompare = string2Compress[index]
            
            // fetching second letter to compare
            let secondIndex = string2Compress.index(string2Compress.startIndex,offsetBy:i+1)
            let secondLetterToCompare = string2Compress[secondIndex]
            
            //pass the above 2 letters to function to compare
            compareTwoConsecutiveLetters(firstLetter: firstLetterToCompare, secondLetter: secondLetterToCompare)
            
            //Check if comparing the last two letters
            if i == stringlenth - 1 {
                // append last letter count to compressed string
                appendLetterCount()
            }
        }
    }
    // return compressed string
    return compressedString
}

// function to compare two consecutive letters
func compareTwoConsecutiveLetters(firstLetter : Character, secondLetter : Character){
    
    // chcek if letters are same
    if firstLetter == secondLetter {
        
        // add one to the letter count ie 0 to 1
        letterCountStored += 1
        
        //check if string is empty
        if compressedString.isEmpty == true {
            
            //add first letter to compressed string
            compressedString = compressedString + String(firstLetter)
            
            // since first 2 letters are same add one to the letter count ie 1 to 2
            letterCountStored += 1
        }
    }
    else {
        
        // check if compressed string is empty
        if compressedString.isEmpty == true {
            
            // add one to the letter count
            letterCountStored += 1
            
            // append first letter to compressed string
            compressedString = compressedString + String(firstLetter)
            
            // append first letter count to compressed string
            appendLetterCount()
            
            // append second letter to compressed string
            compressedString = compressedString + String(secondLetter)
            
            // reset the letter count
            letterCountStored = 1
            
            
        }
            // if compressed string alredy has first letter
        else if compressedString.count==1 {
            
            // add one to the letter count
            // letterCountStored += 1
            
            /// append first letter count to compressed string
            appendLetterCount()
            
            // append second letter to compressed string
            compressedString = compressedString + String(secondLetter)
            
            // reset the letter count
            letterCountStored = 1
        }
        else {
            // append first letter count to compressed string
            appendLetterCount()
            
            // append second letter to compressed string
            compressedString = compressedString + String(secondLetter)
            
            // reset the letter count
            letterCountStored = 1
        }
    }
}



// function to append letter count
func appendLetterCount(){
    
    // check if letter occurs more than once
    if letterCountStored > 1 {
        
        //append to compressed string
        compressedString = compressedString + String(letterCountStored)
        
    }
}


//pass the string to compress to compressString function
var compressedStringOutput = compressString(string2Compress: stringtoCompress)
print(compressedStringOutput)



*/

/*
let example = "aabccccaaa"

func compressedString(string: String) -> String{
    
    var previousCharacter: Character?
    var currentCharacterCount: Int = 1
    
    //The string to return
    var compressedString = ""
    
    for(index, character) in string.enumerated() {
        
        guard let prevCharacter = previousCharacter else{
            previousCharacter = character
            continue
        }
        
        if character == prevCharacter{
            currentCharacterCount += 1
        }else{
            compressedString += "\(prevCharacter)\(currentCharacterCount)"
            currentCharacterCount  = 1
        }
        previousCharacter = character
    }
    return compressedString.count < string.count ?
    compressedString : string
}












