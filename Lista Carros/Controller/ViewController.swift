//
//  ViewController.swift
//  Lista Carros
//
//  Created by Eduardo Sumiya on 25/09/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController /*, UITableViewDataSource, UITableViewDelegate  */ {
    

    var car:responseCarros!
    @IBOutlet weak var tbl: UITableView!
    
    
        var sectionName : [String]! = []
        var sectionCarros : [String]! = []

    
    
    override func viewDidLoad() {
       // tbl.dataSource = self
       // tbl.delegate = self
        getApiResponse()
        
        print(car.marcas.count)
        print(car.veiculos.count)

        var marcas = car.marcas
        var carros = car.veiculos

        
        for marca in marcas! {
            for carro in carros! {
                if carro.marca_id == marca.marca_id {
                    print("carro -> \(carro.nome!) pertence a marca -> \(marca.nome!)")
                    
                }
                sectionCarros.append(carro.nome)
            }

            var marcaNome = marca.nome!
            sectionName.append(marcaNome)
        }
        
        print(sectionName)
        print(sectionCarros)
        
    }

    
    func getApiResponse() -> responseCarros {
        car = mockService.getCarros()
        return car
    }
    
    func sortData(){
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
       print(sectionName.count)
        return sectionName.count
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
//
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return sectionName.
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return car.marcas.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }


}

