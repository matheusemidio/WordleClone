//
//  ViewController.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-16.
//
import Foundation
import UIKit



class ViewController: UIViewController {
    
    
    public var responseGlobal : [String]?
    public var wordy : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCall()
                
    }

    func apiCall()
    {
        //This function will call the api and get a 20 words array of random words as a response
        
        //let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(wordInput)")!
        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=20&swear=0")!
        //let url = URL(string: "https://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
        URLSession.shared.fetchData(at: url) { result in
          switch result {
          case .success(let words):
              print("\nThe Array of words as a response is \(words)")
              self.responseGlobal = words
              self.pickWord(array: self.responseGlobal!)
          case .failure(let error):
              print(error)
          }
        }
        
   
//        let url = URL(string: "http://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
//        URLSession.shared.fetchData(at: url) { result in
//          switch result {
//          case .success(let apiResponse):
//              print("\nThe word is \(apiResponse)")
//              //self.responseGlobal = word[0].word
//          case .failure(let error):
//              print(error)
//          }
//        }
    }
    
    func pickWord(array : [String])
    {
        //This function will iterate through the array of random words and pick one that has 5 chars length
        
        var condition : Bool = false
        for element in array{
            if(element.count == 5){
                self.wordy = element
                print("\nThe wordy is \(self.wordy!)\n")
                condition = true
                break
            }
        }
        if(condition == false)
        {
            apiCall()
        }
    }

}

