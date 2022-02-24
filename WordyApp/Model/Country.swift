//
//  Country.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-24.
//

import Foundation

struct Country : Decodable
{
    let code : String
    let currencyCodes : [String]
    let name : String
    let wikiDataId : String
}
