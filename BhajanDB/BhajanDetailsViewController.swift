//
//  BhajanDetailsViewController.swift
//  BhajanDB
//
//  Created by Kanchiraju on 1/2/16.
//  Copyright © 2016 Kanchy. All rights reserved.
//

import UIKit
import SwiftyJSON

class BhajanDetailsViewController: UIViewController {
    
    //MARK:- Properties
    
    
    @IBOutlet weak var lyricsLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var thisBhajan = Bhajan()
  
    var bhajanID: String = ""
    let networkingHelp = NetworkingHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkingHelp.getBhajanInfo(bhajanID) { (bhajan) -> () in
            self.lyricsLabel.text = bhajan.lyrics
            self.translationLabel.text = bhajan.translation
            self.languageLabel.text = bhajan.language
            
        }
        
        self.navigationItem.title = "BhajanDB"
        
        //print("Final Result: ",bhajanResult.count)
        // print(bhajanResult(0).title)
                // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
