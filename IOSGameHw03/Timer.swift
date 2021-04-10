//
//  Timer.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/9.
//

import Foundation

class MyTimer: ObservableObject
{
    private var frequency:Double = 0.01
    private var timer: Timer?
    private var startDate: Date?
    @Published var secondsElapsed:Double = 0
    
    func start(){
        secondsElapsed = 0
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true){
            timer in
            self.secondsElapsed += self.frequency
        }
    }
    
    func stop(){
        timer?.invalidate()
        timer = nil
    }
    
    func cont(){
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true){
            timer in
            self.secondsElapsed += self.frequency
        }
    }
    func getDate() -> Date{
        return startDate!
    }
}
