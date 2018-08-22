//
//  FavoriteCities.swift
//  Project 05 City
//
//  Created by Chris on 22/8/2018.
//  Copyright © 2018 Chris. All rights reserved.
//

import Foundation

struct FavoriteCities: Codable {
    var cities: [City]
    
    struct City: Codable {
        var name: String
        var info: String
        var image: String
    }
    
    init() {
        cities = [City]()
        if let url = Bundle.main.url(forResource: "city", withExtension: "json"),
            let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let fav = try? decoder.decode(FavoriteCities.self, from: data){
                cities = fav.cities
            }
        }
    }
}
