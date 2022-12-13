//
//  ViewController.swift
//  bayrakapp_SQLite
//
//  Created by Şehriban Yıldırım on 12.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        databaseCopy()
        
    }

    func databaseCopy(){
        
        let bundlePath = Bundle.main.path(forResource: "bayrakquiz", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("bayrakquiz.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veri Tabanı Mevcut.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }

}

