//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//  Copyright © 2016 MakeSchool. All rights reserved.
//
// Created by Xiao Zheng.
//

import UIKit

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
                // 1
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                // 2
                listNotesTableViewController.tableView.reloadData()
            } else {
                // 3
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                newNote.modificationTime = NSDate()
                listNotesTableViewController.notes.append(newNote)
            }
        }
        //If cancel do nothing
        
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
