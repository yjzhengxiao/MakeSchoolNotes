//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//  Copyright © 2016 MakeSchool. All rights reserved.

// Created by Xiao Zheng.
//

import UIKit
import RealmSwift

class ListNotesTableViewController: UITableViewController {
    
    // Refresh the Results Note Array for display
    var notes: Results<Note>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    // Generating the corresponding note
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // Populate the each row with note's title and date
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // The indexPath is an argument that was passed into cellForRowAtIndexPath and is how the table view tells us what row it 
        // wants a cell for.
        let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell
        
        // Getting the current row. We access the row property of index path to figure out which row.
        let row = indexPath.row
        
        // Assign the note
        let note = notes[row]
        
        // Setting the note's title
        cell.noteTitleLabel.text = note.title
        
        // Setting the note's text
        cell.noteModificationTimeLabel.text = note.modificationTime.convertToString()
        
        return cell
    }
    
    // Retrieving all the datas
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = RealmHelper.retrieveNotes()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let note = notes[indexPath.row]
                // 3
                let displayNoteViewController = segue.destinationViewController as! DisplayNoteViewController
                // 4
                displayNoteViewController.note = note
                
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    // Deleting the note
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            //1
            RealmHelper.deleteNote(notes[indexPath.row])
            //2
            notes = RealmHelper.retrieveNotes()
        }
    }
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
  
}