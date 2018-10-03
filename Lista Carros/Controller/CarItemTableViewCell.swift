//
//  CarItemTableViewCell.swift
//  Lista Carros
//
//  Created by André Brilho on 02/10/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import UIKit

class CarItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblPreco: UILabel!
    
    

    func configureDataCell(veiculoItem: Veiculo?){
        if let veiculo = veiculoItem {
            lblNome.text = veiculo.nome
            let valor = String(format: "%.2f", veiculo.valor!)
            lblPreco.text = "R$ - " + valor
        }
    }

}
