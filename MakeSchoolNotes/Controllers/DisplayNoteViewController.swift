//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//  Copyright © 2016 MakeSchool. All rights reserved.
//
// Created by Xiao Zheng.
//

import UIKit

class DisplayNoteViewController: UIViewController {
        
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Some printing for debugging.
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                print("Save button tapped")
                
                // Performe the note saving function
                let note = Note()
    
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text
                note.modificationTime = NSDate()
                
                // 1
                let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
                // 2
                listNotesTableViewController.notes.append(note)
            }
        }
        
        
    }
    
    // Rest the note view to empty! Rest everything befroe view appear!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        noteTitleTextField.text = "“title here!”"
        noteContentTextView.text = "# Please enter the text from here!"
    }
    
}
