//
//  Playlist.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    
    let name: String
    var songs: [Song]
    
    private let kName = "name"
    private let kSongs = "songs"
    // We will need a dictionary of dictionaries becuase songs has mutliple objects
    var dictionaryCopy: [String: AnyObject] {
        return [kName: name, kSongs: songs.map({$0.dictionaryCopy})]
    }
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            songDictionaries = dictionary[kSongs] as? [[String: AnyObject]] else {
                return nil
        }
        self.name = name
        self.songs = songDictionaries.flatMap({Song(dictionary: $0)})// Map is some bullshit
    }
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}