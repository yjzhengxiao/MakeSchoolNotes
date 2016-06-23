//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    var notes = [Note]()
    
    // 1
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // 2
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                print("Table view cell tapped")
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
  
}