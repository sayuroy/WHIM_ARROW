//
//  ResultView.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import SwiftUI

struct ResultView: View {
  @EnvironmentObject var game: Game
  
  func resetData() {
    UserDefaults.standard.removeObject(forKey: "total_charenge")
    UserDefaults.standard.removeObject(forKey:"total_hit")
    UserDefaults.standard.removeObject(forKey:"total_rate")
    UserDefaults.standard.removeObject(forKey:"fivehitCount")
    game.result_total = 0
    game.result_hit = 0
    game.result_rate = 0
    game.fivehit = 0
  }
 
    var body: some View {
      ZStack{
        Color("myblue")
          .edgesIgnoringSafeArea(.all)
          .overlay( Capsule()
            .foregroundColor(.black)
            .opacity(0.2)
            .frame(width: 100, height: 8)
            .padding()
            , alignment: .top)
        if (game.result > 2){
            LottieactionView(filename: "sozai02")
            .frame(width: 100, height: 100)
            .position(x: 350, y: 100)
        }else{
            LottieactionView(filename: "sozai01")
            .frame(width: 100, height: 100)
            .position(x: 330, y: 100)
        }
        LottieactionView(filename: "shine")
          .offset(x: -100, y: -150)
        VStack {
          Text("RESULT")
            .font(.system(size: 60))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding(30)
          Text("\(game.result) SUCCESS！")
            .font(.system(size: 40))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
          Group {
            if (game.result > 2){
              Text("Wonderful!")
            }else{
              Text("No luck...")
            }
          }.font(.system(size:30)).foregroundColor(Color.white)
            .frame(width: 300, height: 30, alignment: .topTrailing)
          Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color.white)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .clipped()
            .rotation3DEffect(.degrees(0), axis: (x:0, y:1, z:0))
            .padding(.bottom, 50)
          Group{
          Text("TOTAL CHARENGE : \(game.result_total)")
            .fontWeight(.bold)
          Text("TOTAL HIT : \(game.result_hit)")
            .fontWeight(.bold)
          Text("HITRATE : \(game.result_rate) %")
            .fontWeight(.bold)
          Text("5 HIT : \(game.fivehit) ")
            .fontWeight(.bold)
            .padding(.bottom, 30)
          }.foregroundColor(Color.white)
            .font(.system(size: 25))
          ZStack{
            Button(action: {
              self.resetData()
            } ) {
              Text("        RESET RECORD")
                .foregroundColor(Color("myblue"))
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(10)
                .background(Color("mygreen"))
                .cornerRadius(15, antialiased: true)
            }
            slowmo()
            .frame(width: 40)
            .foregroundColor(Color("myblue"))
              .offset(x: -110)
          }
          Spacer()
        }
      }
    }
}

struct slowmo: View {
  var body: some View {
    Image(systemName: "slowmo")
    .resizable()
      .aspectRatio(contentMode: .fit)
  }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
      .environmentObject(Game())
    }
}
