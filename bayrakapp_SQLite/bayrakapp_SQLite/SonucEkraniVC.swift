//
//  SonucEkraniVC.swift
//  bayrakapp_SQLite
//
//  Created by Şehriban Yıldırım on 12.12.2022.
//

import UIKit

class SonucEkraniVC: UIViewController {

    @IBOutlet weak var dogruyanlislabel: UILabel!
    
    @IBOutlet weak var basariyuzdelabel: UILabel!
    
    var dogruSayisi :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        if let d = dogruSayisi{
            dogruyanlislabel.text = "\(d) DOĞRU \(5-d) YANLIŞ"
            basariyuzdelabel.text = "% \((d*100)/5) Başarı"
        }

        
    }
    

    @IBAction func tekrarDene(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
