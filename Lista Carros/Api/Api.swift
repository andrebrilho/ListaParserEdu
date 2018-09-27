//
//  Api.swift
//  Lista Carros
//
//  Created by André Brilho on 26/09/2018.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit

public class mockService: NSObject {

    static func getCarros() -> responseCarros {
        var listaResponse:responseCarros!
            if let url = Bundle.main.url(forResource: "Carros", withExtension: "json") {
                
                do {
                    let data = try? Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    do {
                        let decodableJSON = try decoder.decode(responseCarros.self, from: data!)
                        listaResponse = decodableJSON
                    } catch let error {
                        print(error.localizedDescription)
                    }
        }
    }
        return listaResponse
}

}
