//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Selahattin EDİN on 4.02.2024.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var labelFilm: UILabel!
    @IBOutlet weak var labelFilmFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    
    var film : Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            labelFilm.text = f.ad
            labelFilmFiyat.text = "\(f.fiyat!) ₺"
            imageViewFilm.image = UIImage(named: f.resim!)
            
        }

        
    }



  

}
