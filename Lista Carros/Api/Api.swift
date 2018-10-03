//
//  Api.swift
//  Lista Carros
//
//  Created by André Brilho on 26/09/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit

class mockService: NSObject {
    
    static let shared = mockService()
    
    func getCarrosList(completion: (_ result: [Marca]?) ->(), failure: (_ error: Error)-> ()) {
        
        if let url = Bundle.main.url(forResource: "Carros", withExtension: "json") {
            
            do {
                let data = try? Data(contentsOf: url)
                let decoder = JSONDecoder()
                do {
                    let decodableJSON = try decoder.decode(ResponseCarros.self, from: data!)
                    completion(getReordeCarList(carros: decodableJSON))
                    print(completion)
                                    } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    fileprivate func getReordeCarList(carros: ResponseCarros) -> [Marca]? {
        
        var marcaList = [Marca]()
        
        if let marcas = carros.marcas {
            for marca in marcas {
                if let veiculos = carros.veiculos {
                    let veiculosFiltred = veiculos.filter({ return $0.marca_id == marca.marca_id })
                    
                    if veiculosFiltred.count > 0 {
                        marca.carros = [Veiculo]()
                        for veiculo in veiculosFiltred {
                            marca.carros?.append(veiculo)
                        }
                    }
                }
                marcaList.append(marca)
            }
        }
        print(marcaList)
        return marcaList
    }
}

