//
//  ViewController.swift
//  carsList
//
//  Created by Ahmet Mert ÖZ on 20.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var arabaAd = [String]()
    
    var arabaResim = [UIImage]()
    
    var secilenResim = UIImage()
    var secilenYazi = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        arabaAd.append("Fiat Punto")
        arabaAd.append("Fiat 500X")
        arabaAd.append("Ford GT40")
        arabaAd.append("Porsche")
        
        arabaResim.append(UIImage(named: "punto.jpeg")!)
        arabaResim.append(UIImage(named: "fiat500x.jpeg")!)
        arabaResim.append(UIImage(named: "gt40.jpeg")!)
        arabaResim.append(UIImage(named: "porsche.jpeg")!)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            arabaAd.remove(at: indexPath.row)
            arabaResim.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = arabaAd[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arabaAd.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        secilenYazi = arabaAd[indexPath.row]
        secilenResim = arabaResim[indexPath.row]
        
        performSegue(withIdentifier: "toNewPage", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewPage"{
            
            let destinationVC = segue.destination as! ViewController2
            
            destinationVC.gelenYazi = secilenYazi
            destinationVC.gelenResim = secilenResim
            
        }
    }


}

