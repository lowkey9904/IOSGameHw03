//
//  ContentView.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/3/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    init() {
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none

    }
    @State private var buttonColor = Color(red: 232/255, green: 79/255, blue: 89/255)
    @State private var showLB = false
    @State private var showAnti = false
    @State private var musicImg = "play.fill"
    @State var looper: AVPlayerLooper?
        var body: some View {
        NavigationView{
        VStack{
            //學習詞彙
            rainbowText(myText: "Vokabeln", fontStyle: "WickedMouse", fontSize: 55)
            rainbowText(myText: "Lernen", fontStyle: "WickedMouse", fontSize: 55)
            Spacer()
            //開始
            Button(action: {
                showAnti = true
                print(showAnti)
            }) {
                Text("Start")
                    .font(.custom("Twiddlestix", size: 35))
                    .frame(width: 300, height: 50)
                    .padding(6)
                    .background(Image("ButtonBG")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.7))
                    .foregroundColor(buttonColor)
                    .cornerRadius(15)
            }.padding()
            .fullScreenCover(isPresented: $showAnti, content: {
                AntiView()
            })
            Button(action:{
                showLB = true
            }){
                Text("Bestenliste")
                    .font(.custom("Twiddlestix", size: 35))
                    .frame(width: 300, height: 50)
                    .padding(6)
                    .background(Image("ButtonBG")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.7))
                    .foregroundColor(buttonColor)
                    .cornerRadius(15)
            }.padding()
            .sheet(isPresented: $showLB, content: {
                LeaderboardView()
            })
            Spacer()
        }
        .navigationBarItems(
                trailing: Button(action:{
                if myPlayer.timeControlStatus == .playing {
                    myPlayer.pause()
                    musicImg = "play.slash.fill"
                } else {
                    myPlayer.play()
                    musicImg = "play.fill"
                }
            }){
                Text("Music")
                    .font(.custom("Twiddlestix", size: 30))
                    .foregroundColor(.white)
                Image(systemName: musicImg)
                    .foregroundColor(.white)
                    .imageScale(.large)
            })
            .background(Image("GameBG").resizable()
            .scaledToFill()
            .frame(width: 800, height: 1200, alignment: .center))
            .onAppear {
                vocArray.shuffle()
                for v in 0..<vocArray.count {
                    let lastone = vocArray[v].count - 2
                    vocArray[v][0...lastone].shuffle()
                }
                let fileUrl = Bundle.main.url(forResource: "music", withExtension: "mp4")!
                let item = AVPlayerItem(url: fileUrl)
                //Play Background Music
                if myPlayer.timeControlStatus == .playing || firstIntoAPP {
                    musicImg = "play.full"
                }
                else {
                    musicImg = "play.slash.fill"
                }
                if firstIntoAPP {
                    self.looper = AVPlayerLooper(player: myPlayer, templateItem: item)
                    myPlayer.volume = 0.1
                    myPlayer.play()
                    firstIntoAPP = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct rainbowText: View {
    var myText:String
    var fontStyle:String
    var fontSize:Int
        
    var body: some View {
        HStack {
            let textArray = myText.map(String.init)
            ForEach(0..<textArray.count) { (index) in
                Text(textArray[index])
                    .foregroundColor(colorArray.randomElement())
            }
        }.font(.custom(fontStyle, size: CGFloat(fontSize)))
        .padding(.horizontal)
        
    }
}

