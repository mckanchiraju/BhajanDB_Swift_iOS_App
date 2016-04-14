//
//  NetworkingHelper.swift
//  BhajanDB
//
//  Created by Kanchiraju on 2/21/16.
//  Copyright © 2016 Kanchy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkingHelper{
    
    //MARK - Properties
    
    func getDataFromServer(searchTag: String, completed: ([Bhajan]) -> ()) {
        var myURL = ""
        if(searchTag != ""){
            myURL = URL_SEARCH + searchTag
            
        } else {
            myURL = URL_SEARCH_NOKEY
        }
        let url = NSURL(string: myURL)
        Alamofire.request(.GET, url!).responseJSON{
            jsonData in
            let result = JSON(jsonData.result.value!)
            
            var bhajanArr = [Bhajan]()
            
            if let resData = result.arrayObject {
                //print(resData)
                for value in resData{
                    let newBhajan = Bhajan()
                    
                    if let id = value["bhajan_id"] as? String{
                        newBhajan.setID(id)
                    }
                    if let title = value["title"] as? String{
                        newBhajan.setTitle(title)
                    }
                    if let lang = value["language"] as? String{
                        newBhajan.setLanguage(lang.capitalizedString)
                    }else {
                        newBhajan.setLanguage("")
                    }
                    
                    bhajanArr.append(newBhajan)
                }
                //print(bhajanArr)
            }
            
            completed(bhajanArr)
            
        }
        
    }
    
    
    func getBhajanInfo(searchTag: String, completed: (Bhajan) -> ()){
        let myURL = URL_BHAJAN + searchTag
        print(myURL)
        let url = NSURL(string: myURL)
        Alamofire.request(.GET, url!).responseJSON{
            response in
            
            let result = response.result
            let newBhajan = Bhajan()
            if let dict  = result.value as? Dictionary<String, AnyObject> {
                if let id = dict["bhajan_id"] as? String {
                    newBhajan.setID(id)
                }
                if let title = dict["title"] as? String {
                    newBhajan.setTitle(title)
                }
                if let lyrics = dict["lyrics"] as? String{
                    let editedLyrics = lyrics.stringByReplacingOccurrencesOfString("\\n", withString: ",\r")
                    
                    newBhajan.setLyric(editedLyrics)
                }
                if let language = dict["language"] as? String{
                    newBhajan.setLanguage(language.capitalizedString)
                }
                 
                completed(newBhajan)
            }
            
        }//Alamofire Get Call

        
    }
    
    
}