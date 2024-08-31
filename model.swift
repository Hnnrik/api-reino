//
//  model.swift
//  mapa
//
//  Created by Turma02-26 on 30/08/24.
//

import Foundation

struct Personagem : Decodable, Identifiable{
    let id: String
    let name: String?
    let dateOfBirth: String?
    let image: String?
    
}
