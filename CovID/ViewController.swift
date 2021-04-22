//
//  ViewController.swift
//  CovID
//
//  Created by Setiawan Joddy on 22/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        let url = URL(string: "https://api.kawalcorona.com/indonesia/#")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let covid = try JSONDecoder().decode([CovidData].self, from: data!)
                for coronavirus in covid {
                    let positif = coronavirus.positif
                    print(positif)
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }


}

struct CovidData: Decodable {
    let positif: String
    let sembuh: String
    let meninggal: String
    let dirawat: String
}
