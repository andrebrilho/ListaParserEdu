//
//  ViewController.swift
//  Lista Carros
//
//  Created by Eduardo Sumiya on 25/09/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbl: UITableView!
    
    var carListDataSourceAndDelegate:CarListaDataSourceAndDelegate?
    
    var marcaLista:[Marca]? = []
    
    override func viewDidLoad() {
        mockService.shared.getCarrosList(completion: { (marcas) in
            self.marcaLista = marcas
            configureData()
        }) { (error) in
            print("error")
        }
    }
    
    fileprivate func configureData(){
        carListDataSourceAndDelegate = CarListaDataSourceAndDelegate(marcas: marcaLista, carTableView: tbl)
    }
    


}

