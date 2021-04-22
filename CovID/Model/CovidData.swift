//
//  CovidData.swift
//  CovID
//
//  Created by Setiawan Joddy on 23/04/21.
//

import Foundation

struct CovidData: Decodable {
    let positif: String
    let sembuh: String
    let meninggal: String
    let dirawat: String
}
