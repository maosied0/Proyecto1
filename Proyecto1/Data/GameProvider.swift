//
//  GameProvider.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 13/2/26.
//

import Foundation


    class GameProvider {
        
        
        static let SERVER_URL: String = "https://www.freetogame.com/api"
    
        
       static func getGameList() async -> [Game] {
            
            let url = URL(string: "\(SERVER_URL)/games")
            
            guard let url = url else {
                print("Invalid URL")
                return []
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let result = try JSONDecoder().decode([Game].self, from: data)
               return result
                
            }catch {
                print("invalid Data")
                return []
            }
        }
        
       static func getGameById(id: Int) async -> Game? {
            
            let url = URL(string: "\(SERVER_URL)/game?id=\(id))")
            
            guard let url = url else {
                print("Invalid URL")
                return nil
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let result = try JSONDecoder().decode(Game.self, from: data)
                
               return result
                
            }catch {
                print("invalid Data")
                return nil
            }
        }
}
