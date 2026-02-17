//
//  Game.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 13/2/26.
//

import Foundation

struct Game: Codable {

    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String?
    let platform: String
    let publisher: String
    let genre: String
    let developer: String
    let releaseDate: String
    let profileUrl: String
    let description: String?
   // let systemRequirement: SystemRequirments?
  //  let screenshots: [Screenshot]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case shortDescription = "short_description"
        case platform
        case publisher
        case genre
        case developer
        case releaseDate = "release_date"
        case profileUrl = "freetogame_profile_url"
        case description
    }
}
/*struct SystemRequirments: Codable {
    let os: String
    let processor: String
    let memory: String
    let graphics: String
    let storage: String
}
struct Screenshot: Codable {

    let image: String
}
 
 
 
 
*/
