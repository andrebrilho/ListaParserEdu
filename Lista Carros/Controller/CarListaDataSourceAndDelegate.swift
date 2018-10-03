//
//  CarListaDataSourceAndDelegate.swift
//  Lista Carros
//
//  Created by André Brilho on 02/10/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit

class CarListaDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var marcas: [Marca]?
    
    //MARK: Inicialização do data source e delegate com o array de marcas e com a tabela
    init(marcas: [Marca]?, carTableView:UITableView) {
        super.init()
        self.marcas = marcas
        self.configureTable(carTableView: carTableView)
    }
    
    func configureTable(carTableView: UITableView) {
        carTableView.register(UINib(nibName: "CarItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CarItemTableViewCell")
        carTableView.dataSource = self
        carTableView.delegate = self
    }
    
    //MARK: DataSource and Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return (marcas?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (marcas?[section].carros?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarItemTableViewCell", for: indexPath) as? CarItemTableViewCell else{
            return UITableViewCell()
        }
        cell.configureDataCell(veiculoItem: marcas?[indexPath.section].carros?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed("HeaderView", owner: self)?.first as? HeaderViewController else {
            return UITableViewCell()
        }
        header.configureHeader(marcaItem: marcas?[section])
        return header
    }
    
    //MARK: Properties Size for cell and for header
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

