//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let playlistName = playlistNameTextField.text where playlistName.characters.count > 0 {
            PlaylistController.sharedInstance.addPlaylist(playlistName)
            tableView.reloadData()
            playlistNameTextField.text = ""
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PlaylistController.sharedInstance.playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlists"
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row] // calls?
            PlaylistController.sharedInstance.deletePlaylist(playlist) // What do i want to delete? (playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) // now i need to delete the row
        }
    }
    
    // MARK: - Navigation // below is a method
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSongList", let songListTVC = segue.destinationViewController as?
            SongListTableViewController, let playlistCell = sender as? UITableViewCell,
            let indexPath = tableView.indexPathForCell(playlistCell) {
            songListTVC.playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        }
    }
}



// if seque.identifer - means this is the seque we are using
// segue. destinationVC - means where the segue is going to to
// as? is what casts it as SongListTableVC

// let indexpath = tableView


