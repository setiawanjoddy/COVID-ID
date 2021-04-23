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
    @IBOutlet weak var positifInformationView: UIView!
    @IBOutlet weak var dirawatInformationView: UIView!
    @IBOutlet weak var sembuhInformationView: UIView!
    @IBOutlet weak var meninggalInformationView: UIView!
    
    var covidManager = CovidManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        covidManager.delegate = self
        covidManager.getData()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        positifInformationView.layer.cornerRadius = 15
        positifInformationView.layer.applySketchShadow()
        
        dirawatInformationView.layer.cornerRadius = 15
        dirawatInformationView.layer.applySketchShadow()
        
        sembuhInformationView.layer.cornerRadius = 15
        sembuhInformationView.layer.applySketchShadow()
        
        meninggalInformationView.layer.cornerRadius = 15
        meninggalInformationView.layer.applySketchShadow()
    }
    
}

extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 2,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
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
