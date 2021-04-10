//
//  Data.swift
//  IOSGameHwCGSize.zero3
//
//  Created by Joker on 2CGSize.zero21/4/5.
//

import Foundation
import SwiftUI
import AVFoundation

struct vocabulary {
    var voc: String
    var index: Int
    var vOffset: CGSize
    var vnewPos: CGSize
    var vCGRect: CGRect = CGRect.zero
}
var hase = [
    //兔
    vocabulary(voc: "h", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "a", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "s", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "hase", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var hund = [
    //狗
    vocabulary(voc: "h", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "u", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "n", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "d", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "hund", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var katze = [
    //貓
    vocabulary(voc: "k", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "a", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "t", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "z", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "katze", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var vogel = [
    //鳥
    vocabulary(voc: "v", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "o", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "g", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "l", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "vogel", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var pinguin = [
    //企鵝
    vocabulary(voc: "p", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "i", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "n", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "g", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "u", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "i", index: 5, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "n", index: 6, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "pinguin", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var giraffe = [
    //長頸鹿
    vocabulary(voc: "g", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "i", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "r", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "a", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "f", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "f", index: 5, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 6, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "giraffe", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var affe = [
    //猴子
    vocabulary(voc: "a", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "f", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "f", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "affe", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var frosch = [
    //青蛙
    vocabulary(voc: "f", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "r", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "o", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "s", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "c", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "h", index: 5, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "frosch", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var biene = [
    //蜜蜂
    vocabulary(voc: "b", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "i", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "n", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "e", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "biene", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var fisch = [
    //魚
    vocabulary(voc: "f", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "i", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "s", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "c", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "h", index: 4, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "fisch", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]
var kalb = [
    //小牛
    vocabulary(voc: "k", index: 0, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "a", index: 1, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "l", index: 2, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "b", index: 3, vOffset: CGSize.zero, vnewPos: CGSize.zero),
    vocabulary(voc: "kalb", index: -1, vOffset: CGSize.zero, vnewPos: CGSize.zero)
]

var colorArray = [Color.red, Color.orange, Color.yellow, Color.green, Color.purple, Color.pink, Color.blue]
var vocArray = [hase, katze, hund, vogel, pinguin, giraffe, affe, frosch, biene, fisch, kalb]
var myPlayer = AVQueuePlayer()
var firstIntoAPP = true
var resultIntoLB = false
