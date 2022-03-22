//
//  ViewController2.swift
//  carsList
//
//  Created by Ahmet Mert ÖZ on 22.03.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    
    var gelenYazi : String?
    var gelenResim : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        carLabel.text = gelenYazi
        imageView.image = gelenResim
        
    }
    

    

}
