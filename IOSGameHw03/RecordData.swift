//
//  RecordData.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/10.
//

import Foundation

class RecordData: ObservableObject {
    @Published var records = [Record](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(records) {
                UserDefaults.standard.set(data, forKey: "records")
            }
        }
    }
        
        init() {
            if let data = UserDefaults.standard.data(forKey: "records") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Record].self,from: data) {
                    records = decodedData
                }
            }
         }
}

