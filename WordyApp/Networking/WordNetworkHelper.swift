//
//  WordNetworkHelper.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-23.
//

import Foundation




extension URLSession {
//  func fetchData(at url: URL, completion: @escaping (Result<[Word], Error>) -> Void) {
//    self.dataTask(with: url) { (data, response, error) in
//      if let error = error {
//        completion(.failure(error))
//      }
//
//      if let data = data {
//        do {
//          let word = try JSONDecoder().decode([Word].self, from: data)
//          completion(.success(word))
//        } catch let decoderError {
//          completion(.failure(decoderError))
//        }
//      }
//    }.resume()
//  }
    
    func fetchDataRandomWord(at url: URL, completion: @escaping (Result<[String], Error>) -> Void) {
      self.dataTask(with: url) { (data, response, error) in
        if let error = error {
          completion(.failure(error))
        }

        if let data = data {
          do {
            let word = try JSONDecoder().decode([String].self, from: data)
            completion(.success(word))
          } catch let decoderError {
            completion(.failure(decoderError))
          }
        }
      }.resume()
    }
    
    func fetchDataDictionary(at url: URL, completion: @escaping (Result<[Word], Error>) -> Void) {
      self.dataTask(with: url) { (data, response, error) in
        if let error = error {
          completion(.failure(error))
        }

        if let data = data {
          do {
            let word = try JSONDecoder().decode([Word].self, from: data)
            completion(.success(word))
          } catch let decoderError {
            completion(.failure(decoderError))
          }
        }
      }.resume()
    }


//    func fetchData(at url: URL, completion: @escaping (Result<ApiResponse, Error>) -> Void) {
//      self.dataTask(with: url) { (data, response, error) in
//        if let error = error {
//          completion(.failure(error))
//        }
//
//        if let data = data {
//          do {
//            let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
//            completion(.success(apiResponse))
//          } catch let decoderError {
//            completion(.failure(decoderError))
//          }
//        }
//      }.resume()
//    }
}

