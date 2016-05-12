//: Playground - noun: a place where people can play

import UIKit

let workingDictionary = ["nameKey" : "Derek", "ageKey": 28, "favMovieKey": "Zoolander"]
let brokenDictionary = ["nameKey": "Steve", "ageKey": 2]








class Person { // make a Person class with name, age, and favorite Movie properties
    
    let nameKey = "nameKey"
    let ageKey = "ageKey"
    let favMovieKey = "favMovieKey"
    
    
    var name : String
    var age: Int
    var favMovie: String
    
    
    var fullDescription: String {
        return "\(name) \(age) \(favMovie)"
    }
    
    
    
    init?(dictionary : [String: AnyObject]){ // init the class with a object of type String: AnyObject
        
        guard let name = dictionary[nameKey] as? String, // We have a failable initilizer with the ?init
            age = dictionary[ageKey] as? Int,
            favMovie = dictionary[favMovieKey] as? String else {
//                self.name = ""
//                self.age = 0
//                self.favMovie = "" This was a mistake on my part... i dont want it to return anything if the person isnt complete.
                return nil
        }
        self.name = name // self refrences the "name" in the class.
        self.age = age
        self.favMovie = favMovie
    }
}

let person = Person(dictionary: workingDictionary)
print(Person)
