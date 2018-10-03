//
//  marcas.swift
//  Lista Carros
//
//  Created by André Brilho on 26/09/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit

public class Marca: Codable {
    
    var marca_id: String?
    var nome: String?
    var abreviacao: String?
    var data_criacao: String?
    var pais: String?
    var nome_dono: String?
    var cidade: String?
    var emblema: String?
    var carros:[Veiculo]?
    
}
