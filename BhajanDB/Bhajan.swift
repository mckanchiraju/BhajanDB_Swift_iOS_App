//
//  Bhajan.swift
//  BhajanDB
//
//  Created by Kanchiraju on 2/21/16.
//  Copyright © 2016 Kanchy. All rights reserved.
//

import Foundation


class Bhajan {
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
    
    private var _id = ""
    private var _language = ""
    private var _lyrics = ""
    private var _title = ""
    private var _translation = ""
    
    var id: String{
        return _id
    }
    
    func setID(newId: String){
        _id = newId
    }
    
    var language: String{
        return _language
    }
    
    func setLanguage(newLang: String){
        _language = newLang
    }
    
    var lyrics: String {
        return _lyrics
    }
    
    func setLyric(newLyric: String){
        _lyrics = newLyric
    }
    
    var title: String {
        return _title
    }
    
    func setTitle(newTitle: String){
        _title = newTitle
    }
    
    var translation: String {
        return _translation
    }
    
    func setTranslation(newTransl: String){
        _translation = newTransl
    }
    
}
