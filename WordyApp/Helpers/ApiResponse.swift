//
//  ApiResponse.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-23.
//

import Foundation

class ApiResponse {
    static func getResponse(wordParameter : String) -> Word
    {
        var wordResponse = Word(word: "No word")
        let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/" + wordParameter)!
        URLSession.shared.fetchData(at: url) { result in
          switch result {
          case .success(let word):
            //print(word)
              //response = word
              //print(word)
              wordResponse = word[0]
          case .failure(let error):
              //print(error)
              //response = "Not found"
              //self._word = "Not found"
              //print(error)
              wordResponse = Word(word: "Not found")
              //wordResponse.word = "Not found"
          }
        }
        return wordResponse
    }
}

