import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.red, .yellow]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1084896281628209153/0_vnbLvw_200x200.jpg")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Mostra um indicador de progresso enquanto a imagem está carregando
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Text("Failed to load image") // Mensagem de erro caso a imagem não carregue
                            @unknown default:
                                Text("Unknown error")
                            }
                        }
                        .padding(.horizontal,95)
                        HStack{
                            VStack(alignment:.leading){
                                Text("Pokedéx")
    
                                
                            }
                            Spacer()
                        }
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding()
                        VStack(alignment:.leading){
                            
                            ForEach(viewModel.chars) { i in
                                NavigationLink(destination: Ficha(persona:i)){
    
                                    
                                    HStack(){
                                        
                                        AsyncImage(url: URL(string: "\(i.image ?? "not found")")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40)
                                                    .clipped()
                                                
                                            case .failure:
                                                Text("Failed to load image")
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                        }
                                        VStack(alignment:.leading){
                                            
                                            Text("\(i.name ?? "No name available")")
                                                .bold()
                                            Text("\(i.dateOfBirth ?? "nothing")")
                                        }
                                        
                                        Spacer()
                                        Image(systemName:"ellipsis")
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        
                    }

                }

            }
            
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
    
}
#Preview {
    ContentView()
}

