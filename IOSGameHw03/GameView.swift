//
//  GameView.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/5.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @State private var offset = CGSize.zero
    @State private var newPosition = CGSize.zero
    @State private var circleFrame = [CGRect](repeating: CGRect.zero, count: 7)
    @State private var charFrame = [CGRect](repeating: CGRect.zero, count: 7)
    @State private var nOffset = [CGSize](repeating: CGSize.zero, count: 7)
    @State private var newPos = [CGSize](repeating: CGSize.zero, count: 7)
    @State private var ansTrue = [Bool](repeating: false, count: 7)
    @State private var showResultPage = false
    @State private var ifFinish = false
    @State private var timePause = false
    @State private var timeAMin: Double = 120
    @State private var nowQIndex: Int = 0
    @State private var userAnswered: Int = 0
    @StateObject var gameTimer = MyTimer()
    var body: some View {
        VStack {
            //Time
            HStack {
                //防止進度條出錯
                if (timeAMin - gameTimer.secondsElapsed >= 0) {
                    ProgressView(value: (timeAMin - gameTimer.secondsElapsed) / timeAMin)
                        .progressViewStyle(YellowShadowProgressViewStyle())
                        .frame(width: 250)
                    Text("\(timeAMin - gameTimer.secondsElapsed, specifier: "%.0f")")
                        .font(.custom("Twiddlestix", size: 30))
                        .foregroundColor(.black)
                        .frame(width: 60)
                        .padding(.horizontal)
                }
                else {
                    ProgressView(value: 0)
                        .progressViewStyle(YellowShadowProgressViewStyle())
                        .frame(width: 250)
                    Text("0")
                        .font(.custom("Twiddlestix", size: 30))
                        .foregroundColor(.black)
                        .frame(width: 60)
                        .padding(.horizontal)
                        .onAppear {
                            gameTimer.stop()
                            showResultPage = true
                        }
                }
                if timePause == false {
                    Button(action: {
                        gameTimer.stop()
                        timePause = true
                        }, label: {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                    })
                }
                else {
                    Button(action: {
                        gameTimer.cont()
                        timePause = false
                        }, label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                    })
                }
            }.padding()
            //Hint(Picture)
            VStack {
                Text("Hinweis")
                    .font(.custom("Twiddlestix", size: 30))
                    .foregroundColor(.black)
                Button(action:{
                    playCharSound(mChar: vocArray[nowQIndex].last!.voc)
                }) {
                    Image(vocArray[nowQIndex].last!.voc)
                        .resizable()
                        
                        .frame(width: 300, height: 300)
                        .scaledToFill()
                        .padding()
                        //.frame(width: 350, height: 350)
                        .border(Color.black, width: 5)
                }
            }
            Button(action:{
                if nowQIndex < vocArray.count - 1 {
                    nowQIndex += 1
                    nOffset = [CGSize](repeating: CGSize.zero, count: 7)
                    newPos = [CGSize](repeating: CGSize.zero, count: 7)
                    ansTrue = [Bool](repeating: false, count: 7)
                    playCharSound(mChar: vocArray[nowQIndex].last!.voc)
                    
                }
                else {
                    showResultPage = true
                }
            }){
                Text("Pass")
                    .font(.custom("Twiddlestix", size: 30))
                    .foregroundColor(.black)
            }.padding()
            Spacer()
            VStack {
                    if vocArray[nowQIndex].count == 5 {
                    HStack {
                    ForEach(0..<4) { (index) in
                        if (index < vocArray[nowQIndex].count) {
                            Text(vocArray[nowQIndex][index].voc)
                                .foregroundColor(.black)
                                .font(.custom("Twiddlestix", size: 40))
                                .frame(width: 35, height: 35)
                                .padding()
                                .cornerRadius(100)
                                .offset(nOffset[index])
                                .gesture(
                                    DragGesture()
                                    .onChanged({ value in
                                        if (ansTrue[index] == false){
                                            nOffset[index].width = newPos[index].width + value.translation.width
                                            nOffset[index].height = newPos[index].height + value.translation.height
                                        }
                                    })
                                    .onEnded({ value in
                                        newPos[index] = nOffset[index]
                                        let mIndex = vocArray[nowQIndex][index].index
                                        let mCGRect = vocArray[nowQIndex][index].vCGRect
                                        if(checkAns(mIndex:mIndex, mCGRect:mCGRect, mNewPos: newPos[index])){
                                            if (ansTrue[index] == false) {
                                                nOffset[index].width = circleFrame[mIndex].minX - mCGRect.minX + 10
                                                nOffset[index].height = circleFrame[mIndex].minY - mCGRect.minY + 5
                                                ansTrue[index] = true
                                                playCharSound(mChar:vocArray[nowQIndex][index].voc)
                                                nextQuestion()
                                            }
                                        }
                                        else {
                                            //回去原本位置
                                            nOffset[index] = CGSize.zero
                                            newPos[index] = CGSize.zero
                                        }
                                    })
                                )
                                .overlay(
                                    GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            vocArray[nowQIndex][index].vCGRect = geometry.frame(in: .global)
                                        })
                                    })
                                )
                        }
                    }}
                        HStack {
                            ForEach(0..<4) { (index) in
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal, 2)
                                    .overlay(
                                        GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            circleFrame[index] = geometry.frame(in: .global)
                                            })
                                        })
                                    )
                                    
                            }
                        }

                    }
                    else if vocArray[nowQIndex].count == 6 {
                    HStack {
                    ForEach(0..<5) { (index) in
                        if (index < vocArray[nowQIndex].count) {
                            Text(vocArray[nowQIndex][index].voc)
                                .foregroundColor(.black)
                                .font(.custom("Twiddlestix", size: 40))
                                .frame(width: 35, height: 35)
                                .padding()
                                .cornerRadius(100)
                                .offset(nOffset[index])
                                .gesture(
                                    DragGesture()
                                    .onChanged({ value in
                                        if (ansTrue[index] == false){
                                            nOffset[index].width = newPos[index].width + value.translation.width
                                            nOffset[index].height = newPos[index].height + value.translation.height
                                        }
                                    })
                                    .onEnded({ value in
                                        newPos[index] = nOffset[index]
                                        let mIndex = vocArray[nowQIndex][index].index
                                        let mCGRect = vocArray[nowQIndex][index].vCGRect
                                        if(checkAns(mIndex:mIndex, mCGRect:mCGRect, mNewPos: newPos[index])){
                                            if (ansTrue[index] == false) {
                                                nOffset[index].width = circleFrame[mIndex].minX - mCGRect.minX + 5
                                                nOffset[index].height = circleFrame[mIndex].minY - mCGRect.minY + 5
                                                ansTrue[index] = true
                                                playCharSound(mChar:vocArray[nowQIndex][index].voc)
                                                nextQuestion()
                                            }
                                        }
                                        else {
                                            //回去原本位置
                                            nOffset[index] = CGSize.zero
                                            newPos[index] = CGSize.zero
                                        }
                                    })
                                )
                                .overlay(
                                    GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            vocArray[nowQIndex][index].vCGRect = geometry.frame(in: .global)
                                        })
                                    })
                                )
                        }
                    }}
                        HStack {
                            ForEach(0..<5) { (index) in
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 75, height: 75)
                                    //.padding(.horizontal, 2)
                                    .overlay(
                                        GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            circleFrame[index] = geometry.frame(in: .global)
                                            })
                                        })
                                    )
                            }
                        }

                    }
                    else if vocArray[nowQIndex].count == 7 {
                    HStack {
                    ForEach(0..<6) { (index) in
                        if (index < vocArray[nowQIndex].count) {
                            Text(vocArray[nowQIndex][index].voc)
                                .foregroundColor(.black)
                                .font(.custom("Twiddlestix", size: 35))
                                .frame(width: 30, height: 30)
                                .padding()
                                .cornerRadius(100)
                                .offset(nOffset[index])
                                .gesture(
                                    DragGesture()
                                    .onChanged({ value in
                                        if (ansTrue[index] == false){
                                            nOffset[index].width = newPos[index].width + value.translation.width
                                            nOffset[index].height = newPos[index].height + value.translation.height
                                        }
                                    })
                                    .onEnded({ value in
                                        newPos[index] = nOffset[index]
                                        let mIndex = vocArray[nowQIndex][index].index
                                        let mCGRect = vocArray[nowQIndex][index].vCGRect
                                        if(checkAns(mIndex:mIndex, mCGRect:mCGRect, mNewPos: newPos[index])){
                                            if (ansTrue[index] == false) {
                                                nOffset[index].width = circleFrame[mIndex].minX - mCGRect.minX + 2
                                                nOffset[index].height = circleFrame[mIndex].minY - mCGRect.minY + 2
                                                ansTrue[index] = true
                                                playCharSound(mChar:vocArray[nowQIndex][index].voc)
                                                nextQuestion()
                                            }
                                        }
                                        else {
                                            //回去原本位置
                                            nOffset[index] = CGSize.zero
                                            newPos[index] = CGSize.zero
                                        }
                                    })
                                )
                                .overlay(
                                    GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            vocArray[nowQIndex][index].vCGRect = geometry.frame(in: .global)
                                        })
                                    })
                                )
                        }
                    }}
                        HStack {
                            ForEach(0..<6) { (index) in
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 60, height: 60)
                                    //.padding(.hoz)
                                    .overlay(
                                        GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            circleFrame[index] = geometry.frame(in: .global)
                                            })
                                        })
                                    )
                            }
                        }

                    }
                    else if vocArray[nowQIndex].count == 8 {
                    HStack {
                    ForEach(0..<7) { (index) in
                        if (index < vocArray[nowQIndex].count) {
                            Text(vocArray[nowQIndex][index].voc)
                                .foregroundColor(.black)
                                .font(.custom("Twiddlestix", size: 25))
                                .frame(width: 20, height: 20)
                                .padding()
                                .cornerRadius(100)
                                .offset(nOffset[index])
                                .gesture(
                                    DragGesture()
                                    .onChanged({ value in
                                        if (ansTrue[index] == false){
                                            nOffset[index].width = newPos[index].width + value.translation.width
                                            nOffset[index].height = newPos[index].height + value.translation.height
                                        }
                                    })
                                    .onEnded({ value in
                                        newPos[index] = nOffset[index]
                                        let mIndex = vocArray[nowQIndex][index].index
                                        let mCGRect = vocArray[nowQIndex][index].vCGRect
                                        if(checkAns(mIndex:mIndex, mCGRect:mCGRect, mNewPos: newPos[index])){
                                            if (ansTrue[index] == false) {
                                                nOffset[index].width = circleFrame[mIndex].minX - mCGRect.minX + 1
                                                nOffset[index].height = circleFrame[mIndex].minY - mCGRect.minY + 1
                                                ansTrue[index] = true
                                                playCharSound(mChar:vocArray[nowQIndex][index].voc)
                                                nextQuestion()
                                            }
                                        }
                                        else {
                                            //回去原本位置
                                            nOffset[index] = CGSize.zero
                                            newPos[index] = CGSize.zero
                                        }
                                    })
                                )
                                .overlay(
                                    GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            vocArray[nowQIndex][index].vCGRect = geometry.frame(in: .global)
                                        })
                                    })
                                )
                        }
                    }}
                        HStack {
                            ForEach(0..<7) { (index) in
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        GeometryReader(content: { geometry in
                                        Color.clear
                                        .onAppear(perform: {
                                            circleFrame[index] = geometry.frame(in: .global)
                                            })
                                        })
                                    )
                            }
                        }
                    }
            }.fullScreenCover(isPresented: $showResultPage, content: {
                ResultView(userAnsNum: userAnswered, userFinish: ifFinish, userTime: gameTimer.secondsElapsed, userDate: gameTimer.getDate(), recordData: RecordData())
            })
            Spacer()
        }.onAppear{
            playCharSound(mChar: vocArray[0].last!.voc)
            gameTimer.start()
            print(vocArray[0].count - 1)
            
        }
        .background(Image("GameBG").resizable()
        .blur(radius: 15.0)
        .scaledToFill()
        .frame(width: 800, height: 1200, alignment: .center))
        //.offset(y: 0)
    }
    
    func checkAns (mIndex: Int, mCGRect: CGRect, mNewPos: CGSize) -> Bool{
        if(mCGRect.minX + mNewPos.width >= circleFrame[mIndex].minX - 30 && mCGRect.maxX + mNewPos.width <= circleFrame[mIndex].maxX + 30 && mCGRect.minY + mNewPos.height >= circleFrame[mIndex].minY - 30 &&
            mCGRect.maxY + mNewPos.height <= circleFrame[mIndex].maxY + 30) {
            return true
        }
        print(mIndex, mCGRect, mNewPos, circleFrame[mIndex])
        return false
    }
    func playCharSound (mChar: String) -> Void {
        let utterance =  AVSpeechUtterance(string: mChar)
        utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    func nextQuestion () -> Void {
        //如果不是全對 則返回
        if ansTrue[0...vocArray[nowQIndex].count - 2].contains(where: { $0 == false }){
            return
        }
        else{
            var charXY = [CGRect]()
            for ci in 0..<vocArray[nowQIndex].count - 1 {
                charXY.append(vocArray[nowQIndex][ci].vCGRect)
            }
            //答對題數增加一
            userAnswered += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                playCharSound(mChar: vocArray[nowQIndex].last!.voc)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if nowQIndex < vocArray.count - 1 {
                        nowQIndex += 1
                        print(nowQIndex)
                        if charXY.count == vocArray[nowQIndex].count - 1 {
                            for vIndex in 0..<vocArray[nowQIndex].count - 1 {
                                vocArray[nowQIndex][vIndex].vCGRect = charXY[vIndex]
                            }
                        }
                        nOffset = [CGSize](repeating: CGSize.zero, count: 7)
                        newPos = [CGSize](repeating: CGSize.zero, count: 7)
                        ansTrue = [Bool](repeating: false, count: 7)
                        playCharSound(mChar: vocArray[nowQIndex].last!.voc)
                    }
                    else {
                        //修正題數 總共應是11題
                        ifFinish = true
                        showResultPage = true
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


struct YellowShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(Color(red: 1, green: 210/255, blue: 74/255))
            .scaleEffect(x: 1, y: 3, anchor: .center)
            .shadow(color: Color(red: 158/255, green: 142/255, blue: 0),
                    radius: 4.0, x: 1.0, y: 3.0)
    }
}

