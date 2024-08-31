//
//  musica.swift
//  scrowview
//
//  Created by Turma02-26 on 27/08/24.
//

import SwiftUI


struct Ficha: View {
    var persona: Personagem
    
    var body: some View {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.red, .yellow]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                VStack{
                    AsyncImage(url: URL(string: "\(persona.image ?? "")")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Mostra um indicador de progresso enquanto a imagem está carregando
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 250,height: 250)
                                .clipped()
                        case .failure:
                            Text("Failed to load image") // Mensagem de erro caso a imagem não carregue
                        @unknown default:
                            Text("Unknown error")
                        }
                        Text("\(persona.name ?? "")")
                            .bold()
                            .font(.system(size:25))
                        Text("\(persona.dateOfBirth ?? "")")
                        
                        HStack{
                            Image(systemName: "shuffle")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 30,height: 30)
                                .padding(.horizontal,20)
                            Image(systemName: "backward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 30,height: 30)
                                .padding(.horizontal,20)
                            Image(systemName: "play.fill")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 45,height: 45)
                                .padding(.horizontal,20)
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 30,height: 30)
                                .padding(.horizontal,20)
                            Image(systemName: "repeat")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 30,height: 30)
                                .padding(.horizontal,20)
                        }
                        .padding(.vertical,40)
                        
                    }
                }
                .foregroundColor(.white)
                
            }
        
    }
}

#Preview {
    Ficha(persona: Personagem(id: "", name: "", dateOfBirth: "", image: ""))
}
