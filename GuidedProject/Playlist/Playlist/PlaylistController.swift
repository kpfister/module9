//
//  PlaylistController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class PlaylistController {
    private let kPlaylists = "storedPlaylists"
    
    static let sharedInstance = PlaylistController()
    
    var playlists = [Playlist]()
    
    init() {
        loadFromPersistentStore()
    }
    
    
    // CRUD
    //Create
    func addPlaylist(name: String) {
        let playlist = Playlist(name: name, songs: [])
        playlists.append(playlist)
        saveToPersistentStore()
    }
    
    //Retrieve
    
    func loadFromPersistentStore() {
        guard let playlistDictionaries = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String: AnyObject]] else {
            return
        }
        playlists = playlistDictionaries.flatMap({Playlist(dictionary: $0)})
    }
    
    
    
    
    
    //Delete
    func deletePlaylist(playlist: Playlist) {
        guard let indexOfPlaylist = playlists.indexOf(playlist) else {
            return
        }
        playlists.removeAtIndex(indexOfPlaylist)
        
    }
    
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let indexOfSong = playlist.songs.indexOf(song) else {
            return
        }
        playlist.songs.removeAtIndex(indexOfSong)
        saveToPersistentStore()
    }
    
    // saves to NSUser Defaults
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(playlists.map({$0.dictionaryCopy}), forKey: kPlaylists)
    }
    
}