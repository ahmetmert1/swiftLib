//
//  ViewController.swift
//  coinYakala
//
//  Created by Ahmet Mert ÖZ on 6.03.2022.
//

import UIKit

class ViewController: UIViewController {

    var kullaniciSkor = 0
    var kalanZaman = 0
    var highScore = 0
    var timerHide = Timer()
    var timerCount = Timer()
    var coinDizi = [UIImageView]()
    
    @IBOutlet weak var kalanZamanLabel: UILabel!
    @IBOutlet weak var skorLabel: UILabel!
    
    @IBOutlet weak var place1: UIImageView!
    @IBOutlet weak var place2: UIImageView!
    @IBOutlet weak var place3: UIImageView!
    @IBOutlet weak var place4: UIImageView!
    @IBOutlet weak var place5: UIImageView!
    @IBOutlet weak var place6: UIImageView!
    @IBOutlet weak var place7: UIImageView!
    @IBOutlet weak var place8: UIImageView!
    @IBOutlet weak var place9: UIImageView!
    
    @IBOutlet weak var enYuksekSkorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        place1.isUserInteractionEnabled = true
        place2.isUserInteractionEnabled = true
        place3.isUserInteractionEnabled = true
        place4.isUserInteractionEnabled = true
        place5.isUserInteractionEnabled = true
        place6.isUserInteractionEnabled = true
        place7.isUserInteractionEnabled = true
        place8.isUserInteractionEnabled = true
        place9.isUserInteractionEnabled = true
        
        let gestureRecog1 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog2 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog3 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog4 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog5 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog6 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog7 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog8 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        let gestureRecog9 = UITapGestureRecognizer(target: self, action: #selector(skorArttir))
        
        place1.addGestureRecognizer(gestureRecog1)
        place2.addGestureRecognizer(gestureRecog2)
        place3.addGestureRecognizer(gestureRecog3)
        place4.addGestureRecognizer(gestureRecog4)
        place5.addGestureRecognizer(gestureRecog5)
        place6.addGestureRecognizer(gestureRecog6)
        place7.addGestureRecognizer(gestureRecog7)
        place8.addGestureRecognizer(gestureRecog8)
        place9.addGestureRecognizer(gestureRecog9)
        
        coinDizi.append(place1)
        coinDizi.append(place2)
        coinDizi.append(place3)
        coinDizi.append(place4)
        coinDizi.append(place5)
        coinDizi.append(place6)
        coinDizi.append(place7)
        coinDizi.append(place8)
        coinDizi.append(place9)
        
        kalanZaman = 10
        kalanZamanLabel.text = "Kalan Zaman : \(kalanZaman)"
        
        //CountDown timer
        timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriSayim), userInfo: nil, repeats: true)
        
        //Hide Timer
        timerHide = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(coinSakla), userInfo: nil, repeats: true)
        


    }
    
    @objc func coinSakla(){
        for coin in coinDizi{
            coin.isHidden = true
        }
        
        let rastgeleSayi = Int.random(in: 0...8)
        coinDizi[rastgeleSayi].isHidden = false
    }
    
    
    @objc func skorArttir(){
        
        kullaniciSkor = kullaniciSkor + 1
        skorLabel.text = "Skor : \(kullaniciSkor)"
        print(kullaniciSkor)
        
    }
    
    @objc func geriSayim(){
        kalanZaman = kalanZaman - 1
        kalanZamanLabel.text = "Kalan Zaman : \(kalanZaman)"
        
        
        if kalanZaman == 0 {
            timerCount.invalidate()
            timerHide.invalidate()
            
            for coin in coinDizi{
                coin.isHidden = true
            }
            
            if self.kullaniciSkor > self.highScore {
                            self.highScore = self.kullaniciSkor
                            enYuksekSkorLabel.text = "En Yüksek Skor : \(self.highScore)"
                            UserDefaults.standard.set(self.highScore, forKey: "highscore")
                        }
            
            let alert = UIAlertController(title: "Süre Bitti", message: "Tekrar oynamak ister misin ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default) { UIAlertAction in
                self.kullaniciSkor = 0
                self.skorLabel.text = "Skor : \(self.kullaniciSkor)"
                self.kalanZaman = 10
                self.kalanZamanLabel.text = "Kalan Zaman : \(self.kalanZaman)"
                
                self.timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.geriSayim), userInfo: nil, repeats: true)
                
                //Hide Timer
                self.timerHide = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.coinSakla), userInfo: nil, repeats: true)
            }
                alert.addAction(okButton)
                alert.addAction(replayButton)
                self.present(alert, animated: true, completion: nil)
                
                
                
                
                
                
            }
            
            
        }
        
    }




