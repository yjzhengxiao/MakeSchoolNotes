//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//  Copyright © 2016 MakeSchool. All rights reserved.
//
// Created by Xiao Zheng.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
        
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        
        if segue.identifier == "Save" {
            if let note = note {
                // Updating the note with new note in the data persistency store SQLlite.
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                RealmHelper.updateNote(note, newNote: newNote)
            } else {
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = NSDate()
                // Adding Note for Data Persistence.
                RealmHelper.addNote(note)
            }
        } //If cancel do nothing
        
        // Retrieving Note from the Data Persistency Store!
        listNotesTableViewController.notes = RealmHelper.retrieveNotes()
    }
    
    // Rest the note view to empty! Rest everything befroe view appear!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        if let note = note {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = "“title here!”"
            noteContentTextView.text = "# Please enter the text from here!"
        }
    }
    
}
