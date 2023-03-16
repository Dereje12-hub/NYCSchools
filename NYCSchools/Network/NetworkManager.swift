//
//  NetworkManager.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import Foundation

protocol NetworkManagerConforming {
    func downloadSchools() async throws -> [NYCSchool]
    func downloadSATs(dbn: String) async throws -> [NYCSAT]
}



class NetworkManager: NetworkManagerConforming {
    
    let decoder = JSONDecoder()
    
    func downloadSchools() async throws -> [NYCSchool] {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode([NYCSchool].self, from: data)
    }
    
    func downloadSATs(dbn: String) async throws -> [NYCSAT] {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode([NYCSAT].self, from: data)
    }
}
