//
//  Response.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-24.
//

import Foundation

struct ApiResponse : Decodable
{
    let data : [Country]
}
