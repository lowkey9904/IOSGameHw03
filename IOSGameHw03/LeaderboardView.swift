//
//  LeaderboardView.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/10.
//

import SwiftUI

struct LeaderboardView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @ObservedObject var recordData = RecordData()
    @State private var return2ContentView = false
    var body: some View {
        VStack{
            //LeaderBoard
            Text("🏆 Bestenliste 🏆")
                .font(.custom("Twiddlestix", size: 42))
                .foregroundColor(.white)
                .padding()
            List{
                ScrollView(.horizontal){
                    HStack {
                        VStack {
                            Text("rank")
                                .padding(.bottom)
                            ForEach(0..<recordData.records.count) { (r) in
                                if r == 0 {
                                    Text("🥇")
                                        .padding(.bottom)
                                }
                                else if r == 1 {
                                    Text("🥈")
                                        .padding(.bottom)
                                }
                                else if r == 2{
                                    Text("🥉")
                                        .padding(.bottom)
                                }
                                else {
                                    Text(String(r + 1))
                                        .padding(.bottom)
                                }
                                
                            }
                        }
                        VStack {
                            Text("username")
                                .padding(.bottom)
                            ForEach(recordData.records) { (r) in
                                if r.userName == ""  {
                                    Text("unknown")
                                        .padding(.bottom)
                                }
                                else {
                                    Text(r.userName)
                                        .padding(.bottom)
                                }
                            }
                        }
                        Spacer()
                        VStack {
                            Text("answered")
                                .padding(.bottom)
                            ForEach(recordData.records) { (r) in
                                Text(String(r.userAnsNum) + "  /  11")
                                    .padding(.bottom)
                            }
                        }
                        Spacer()
                        VStack {
                            Text("Finished")
                                .padding(.bottom)
                            ForEach(recordData.records) { (r) in
                                if r.userifFinish {
                                    Text("YES")
                                        .padding(.bottom)
                                }
                                else {
                                    Text("NO")
                                        .padding(.bottom)
                                }
                            }
                        }
                        Spacer()
                        VStack {
                            Text("use time")
                                .padding(.bottom)
                            ForEach(recordData.records) { (r) in
                                Text("\(r.userTime, specifier: "%.1f")")
                                    .padding(.bottom)
                            }
                        }
                        Spacer()
                        VStack {
                            Text("date")
                                .padding(.bottom)
                            ForEach(recordData.records) { (r) in
                                Text(r.userDateStr)
                                    .padding(.bottom)
                            }
                        }
                    }
                }
            .font(.custom("Twiddlestix", size: 20))
            .listRowBackground(Color.clear)
            .foregroundColor(.white)
            }.padding()
            if resultIntoLB {
                Button(action: {
                    resultIntoLB = false
                    return2ContentView = true
                }){
                    HStack {
                        Text("Startseite")
                            .font(.custom("Twiddlestix", size: 30))
                        Image(systemName: "house")
                            .imageScale(.large)
                    }.foregroundColor(.white)
                    .padding(10)
                    .border(Color.white, width: 2)
                    .cornerRadius(10)
                }.padding()
            }
        }.onAppear{
            UITableView.appearance().separatorColor = .clear
            UITableView.appearance().separatorStyle = .none
            recordData.records.sort {
                if $0.userAnsNum == $1.userAnsNum {
                    return $0.userTime < $1.userTime
                }
                else{
                    return $0.userAnsNum > $1.userAnsNum
                }
            }
//            recordData.records.sort {
//                $0.userTime < $1.userTime
//            }
        }
        .fullScreenCover(isPresented: $return2ContentView, content: {
            ContentView()
        })
        .background(Image("LBBG")
        .resizable()
        .blur(radius: 1)
        .opacity(0.8)
        .scaledToFill()
        .frame(width: 800, height: 1200, alignment: .center))
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
