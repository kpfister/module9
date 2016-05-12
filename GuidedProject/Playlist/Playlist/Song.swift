//
//  Song.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class Song: Equatable {
    
    let title: String
    let artist: String // This is a property, not a computable property
    
    private let kTitle = "title"
    private let kArtist = "artist"
    
    var dictionaryCopy: [String: AnyObject] {
        return [kTitle: title, kArtist: artist] // Remember: dictonaries need a Key kTitle, and a value. title.
    }
    
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String, // What key I want to pull out, and i want it as a string
            artist = dictionary[kArtist] as? String else { // grab another value i want, Else, bring nothing
                return nil
        }
        self.title = title           // This is what i want the dictionary to give me 
        self.artist = artist
    }
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist
}

