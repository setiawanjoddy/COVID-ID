//
//  ViewController.swift
//  CovID
//
//  Created by Setiawan Joddy on 22/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jumlahPositifLabel: UILabel!
    @IBOutlet weak var jumlahDirawatLabel: UILabel!
    @IBOutlet weak var jumlahSembuhLabel: UILabel!
    @IBOutlet weak var jumlahMeninggalLabel: UILabel!
    
    var covidManager = CovidManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        covidManager.delegate = self
        covidManager.getData()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: CovidManagerDelegate {
    func didUpdateData(positif: String, dirawat: String, sembuh: String, meninggal: String) {
        DispatchQueue.main.async {
            self.jumlahPositifLabel.text = positif
            self.jumlahDirawatLabel.text = dirawat
            self.jumlahSembuhLabel.text = sembuh
            self.jumlahMeninggalLabel.text = meninggal
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
