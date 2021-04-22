//
//  CovidManager.swift
//  CovID
//
//  Created by Setiawan Joddy on 23/04/21.
//

import Foundation

protocol CovidManagerDelegate {
    func didUpdateData(positif: String, dirawat: String, sembuh: String, meninggal: String)
    func didFailWithError(error: Error)
}

struct CovidManager {
    
    var delegate: CovidManagerDelegate?
    
    func getData() {
        let url = URL(string: "https://api.kawalcorona.com/indonesia/#")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let covid = try JSONDecoder().decode([CovidData].self, from: data!)
                for covidData in covid {
                    let positif = covidData.positif
                    let dirawat = covidData.dirawat
                    let sembuh = covidData.sembuh
                    let meninggal = covidData.meninggal
                    self.delegate?.didUpdateData(positif: positif, dirawat: dirawat, sembuh: sembuh, meninggal: meninggal)
                }
            } catch {
                self.delegate?.didFailWithError(error: error)
            }
        }
        task.resume()
    }
    
}
