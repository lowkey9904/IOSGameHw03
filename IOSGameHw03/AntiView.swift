//
//  AntiView.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/9.
//

import SwiftUI
import AVFoundation

struct AntiView: View {
    //Are you ready?
    @State private var showText = "bist du bereit ?"
    @State private var textColor = Color.black
    @State private var textSize = 60
    @State private var go2GameView = false
    @State private var moveDistance: CGFloat = 0
    //@State private
    var body: some View {
        VStack {
            Text(showText)
                .font(.custom("Twiddlestix", size: CGFloat(textSize)))
                .foregroundColor(textColor)
                //.offset(x: moveDistance, y: 0)
                .animation(.easeOut)
        }
        .onAppear{
            playCharSound(mChar: showText)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showText = "3"
                textColor = .red
                textSize = 150
                playCharSound(mChar: showText)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showText = "2"
                    textColor = .blue
                    textSize = 150
                    playCharSound(mChar: showText)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showText = "1"
                        textColor = .yellow
                        textSize = 150
                        playCharSound(mChar: showText)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showText = "start !"
                            textColor = .green
                            textSize = 60
                            playCharSound(mChar: showText)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                go2GameView = true
                            }
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
        .background(Image("GameBG").resizable()
        .blur(radius: 15.0)
        .scaledToFill()
        .frame(width: 800, height: 1200, alignment: .center))
        .fullScreenCover(isPresented: $go2GameView, content: {
            GameView()
        })
        
    }
    func playCharSound (mChar: String) -> Void {
        let utterance =  AVSpeechUtterance(string: mChar)
        utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct AntiView_Previews: PreviewProvider {
    static var previews: some View {
        AntiView()
    }
}
