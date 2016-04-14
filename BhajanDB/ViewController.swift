//
//  ViewController.swift
//  BhajanDB
//
//  Created by Kanchiraju on 2/21/16.
//  Copyright © 2016 Kanchy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Mark :- Properties
    
    @IBOutlet weak var searchText: UITextField!
    var editedSearchString = ""
    var searchString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchString = ""
        editedSearchString = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        searchText.text = ""
        editedSearchString = ""
        searchString = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchBhajanAction(sender: UIButton) {
        searchString = searchText.text!
        print("here")
        for char in searchString.characters{
            if(char == " "){
                editedSearchString = editedSearchString + "%20"
            } else {
                editedSearchString = editedSearchString + String(char)
            }
        }
        
        performSegueWithIdentifier("searchSegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print(editedSearchString)
        let vc = segue.destinationViewController as! SearchDBTableViewController
        vc.searchField = ""
        vc.searchField = editedSearchString.capitalizedString
    }

}

