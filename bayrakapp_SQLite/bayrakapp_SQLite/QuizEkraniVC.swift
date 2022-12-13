//
//  QuizEkraniVC.swift
//  bayrakapp_SQLite
//
//  Created by Şehriban Yıldırım on 12.12.2022.
//

import UIKit

class QuizEkraniVC: UIViewController {
    
    @IBOutlet weak var dogrulbael: UILabel!
    
    @IBOutlet weak var yanlıslabel: UILabel!
    
    @IBOutlet weak var sorusayisilabel: UILabel!
    
    @IBOutlet weak var bayrakimageView: UIImageView!
    
    @IBOutlet weak var buttonA: UIButton!
    
    @IBOutlet weak var buttonB: UIButton!
    
    @IBOutlet weak var buttonC: UIButton!
    
    @IBOutlet weak var buttonD: UIButton!
    
    var sorular = [Bayraklar]()
    var yanlisSecenekler = [Bayraklar]()
    var dogruSoru = Bayraklar()
    var sorusayac = 0
    var dogrusayac = 0
    var yanlissayac = 0
    
    var secenekler = [Bayraklar]()
    var seceneklerKaristirmaListesi = Set <Bayraklar>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sorular = Bayraklardao().rastgele5Bayrak()
        soruYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gidilecekvc = segue.destination as! SonucEkraniVC
        gidilecekvc.dogruSayisi = dogrusayac
    }
    
    func soruYukle(){
        sorusayisilabel.text = "\(sorusayac+1). SORU"
        dogrulbael.text = "Doğru : \(dogrusayac)"
        yanlıslabel.text = "Yanlış : \(yanlissayac)"
        
        dogruSoru = sorular[sorusayac]
        
        bayrakimageView.image = UIImage(named: dogruSoru.bayrak_resim!)
        
        yanlisSecenekler = Bayraklardao().rastgele3YanlisSecenekGetir(bayrak_id: dogruSoru.bayrak_id!)
        
        seceneklerKaristirmaListesi.removeAll()
        
        seceneklerKaristirmaListesi.insert(dogruSoru)
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[0])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[1])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[2])
        
        secenekler.removeAll()
        
        for a in seceneklerKaristirmaListesi{
            secenekler.append(a)
        }
        
        buttonA.setTitle(secenekler[0].bayrak_ad, for: .normal)
        buttonB.setTitle(secenekler[1].bayrak_ad, for: .normal)
        buttonC.setTitle(secenekler[2].bayrak_ad, for: .normal)
        buttonD.setTitle(secenekler[3].bayrak_ad, for: .normal)
    }
    
    func dogruKontrol(button:UIButton){
        let buttonyazi = button.titleLabel?.text
        let dogrucevap = dogruSoru.bayrak_ad
        print("Button Yazi: \(buttonyazi!)")
        print("Doğru Cevap: \(dogrucevap!)")
        
        if dogrucevap == buttonyazi {
            dogrusayac += 1
            
        }else{
            yanlissayac += 1
        }
        dogrulbael.text = "Doğru : \(dogrusayac)"
        yanlıslabel.text = "Yanlış : \(yanlissayac)"
        
        
    }
    
    func soruSayacKontrol(){
        sorusayac += 1
        
        if sorusayac != 5{
            
            soruYukle()
        }else{
            
            performSegue(withIdentifier: "tosonucekrani", sender: nil)
        }
    }

    @IBAction func buttonATikla(_ sender: Any) {
        
        dogruKontrol(button: buttonA)
        soruSayacKontrol()
    }
    
    @IBAction func buttonBTikla(_ sender: Any) {
        dogruKontrol(button: buttonB)
        soruSayacKontrol()
    }
    
    @IBAction func buttonCTikla(_ sender: Any) {
        dogruKontrol(button: buttonC)
        soruSayacKontrol()
    }
    
    
    @IBAction func buttonDTikla(_ sender: Any) {
        dogruKontrol(button: buttonD)
        soruSayacKontrol()
    }
    
   
}
