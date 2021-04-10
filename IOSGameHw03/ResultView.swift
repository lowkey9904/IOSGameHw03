//
//  ResultView.swift
//  IOSGameHw03
//
//  Created by Joker on 2021/4/9.
//

import SwiftUI

struct ResultView: View {
    @State private var userName = ""
    @State private var userDateStr = ""
    @State private var nextView = false
    @State var userAnsNum: Int
    @State var userFinish: Bool
    @State var userTime: Double
    @State var userDate: Date?
    
    let dateFormatter = DateFormatter()
    
    var recordData: RecordData
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Name").font(.custom("Twiddlestix", size: 20))) {
                    TextField("Name", text: $userName)
                        .foregroundColor(.primary)
                }
                Section(header: Text("Number of Questions Answered").font(.custom("Twiddlestix", size: 20))) {
                    Text(String(userAnsNum))
                        .foregroundColor(.primary)
                }
                Section(header: Text("Finished or Not").font(.custom("Twiddlestix", size: 20))) {
                    if userFinish {
                        Text("Yes !!")
                        .foregroundColor(.primary)
                    }
                    else {
                        Text("No ...")
                        .foregroundColor(.primary)
                    }
                }
                Section(header: Text("Use Time").font(.custom("Twiddlestix", size: 20))) {
                    Text("\(userTime, specifier: "%.2f")")
                        .foregroundColor(.primary)
                }
                Section(header: Text("Record Date").font(.custom("Twiddlestix", size: 20))) {
                    
                    
                    Text(userDateStr)
                        .foregroundColor(.primary)
                }
            }.foregroundColor(Color.black)
            .font(.custom("Twiddlestix", size: 20))
            Button(action:{
                if userFinish {
                    let record = Record(userName: userName, userTime: userTime, userDateStr: userDateStr, userAnsNum: 11, userifFinish: userFinish)
                    self.recordData.records.insert(record, at: 0)
                }
                else {
                    let record = Record(userName: userName, userTime: userTime, userDateStr: userDateStr, userAnsNum: userAnsNum, userifFinish: userFinish)
                    self.recordData.records.insert(record, at: 0)
                }
                resultIntoLB = true
                self.nextView = true
            }){
                Text("Save")
                .font(.custom("Twiddlestix", size: 20))
                .foregroundColor(.black)
            }
        }.padding()
        .background(Image("GameBG").resizable()
        .blur(radius: 15.0)
        .scaledToFill()
        .frame(width: 800, height: 1200, alignment: .center))
        .fullScreenCover(isPresented: $nextView, content: {
            LeaderboardView()
        })
        .onAppear{
            //Date to String
            dateFormatter.dateFormat = "y / MM / d"
            userDateStr = dateFormatter.string(from: userDate!)
            if userAnsNum == 11 {
                userFinish = true
            }
            else {
                userFinish = false
            }
            print(Int(userTime))
            print(userDateStr)
            print(userFinish)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(userAnsNum: 11, userFinish: true, userTime: 10.0, userDate: Date(), recordData: RecordData())
    }
}
