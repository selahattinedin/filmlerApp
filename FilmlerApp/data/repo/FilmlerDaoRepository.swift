//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Selahattin EDİN on 8.02.2024.
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func filmleriYukle(){
        db?.open()
        var liste = [Filmler]()

        do{
            let rs =  try db!.executeQuery("SELECT * FROM filmler ", values: nil)
            
            while rs.next() {
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")!,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat: Int(rs.string(forColumn: "fiyat"))!)
                liste.append(film)
            }
            filmlerListesi.onNext(liste)

            }catch{
            print(error.localizedDescription)
        }
            
        db?.close()
        
    }
}
