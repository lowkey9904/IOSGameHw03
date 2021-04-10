//
//  Record.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/10.
//

import Foundation

struct Record: Identifiable, Codable  {
    var id = UUID()
    var userName: String
    var userTime: Double
    var userDateStr: String
    var userAnsNum: Int
    var userifFinish: Bool
}
