//: Playground - noun: a place where people can play

import UIKit

class Car {
    
    let make: String
    let model: String
    var year: Int
    
    var fullDescription: String {
        return "\(year) \(make) \(model)"
    }
    
    var dictionaryRepresentation: [String: AnyObject] {
        
        let carDictionary: [String: AnyObject] = ["makeKey": self.make, "modelKey": self.model, "yearKey": self.year]
        
        
        return carDictionary
    }
    
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    init?(dictionary : [String: AnyObject]) { // ? makes this a failable init
        
        guard let make = dictionary["make"] as? String, //casting We are expecting a "String"
            let model = dictionary["model"] as? String,
            let year = dictionary["year"] as? Int else {
                return nil
                
                // If missing somthing
        }
        
        // If everything is here
        
        self.make = make
        self.model = model
        self.year = year
    }
    
}

// Class to dictionary

let myCar = Car(make: "Honda", model: "Civic", year: 2015)

print(myCar.dictionaryRepresentation)

// dictionary to class


let dreamCarDictionary = ["makeKey": "Tesla", "ModelKey": "Model S", "yearKey": 2018 ] // This is a dictionary

let dreamCar = Car (dictionary: dreamCarDictionary)











