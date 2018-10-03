//
//  HeaderViewController.swift
//  Lista Carros
//
//  Created by André Brilho on 02/10/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import UIKit

class HeaderViewController: UIView {
    
    @IBOutlet weak var lblMarcaNome: UILabel!
    
    @IBOutlet weak var lblMarcaPais: UILabel!
    
    func configureHeader(marcaItem: Marca?){
        if let marca = marcaItem {
            lblMarcaNome.text = marca.nome
            lblMarcaPais.text = marca.cidade
        }
        
    }
}
