//
//  viewModel.swift
//  mapa
//
//  Created by Turma02-26 on 30/08/24.
//

import Foundation
class ViewModel : ObservableObject{
    @Published var chars : [Personagem] = []
    
    func fetch(){
        let task = URLSession.shared.dataTask(with: URL(string:"https://hp-api.onrender.com/api/characters/house/gryffindor")!){ data, _,error 
            in
        
        do{
            self.chars = try JSONDecoder().decode([Personagem].self, from: data!)
        }catch{
            print(error)
        }
        }
        task.resume()
    }
}
