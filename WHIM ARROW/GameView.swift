//
//  GameView.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import SwiftUI

struct GameView: View {
  @EnvironmentObject var game: Game
  @State var isResult: Bool = false
  @State var isButton: Bool = true
  @State var gamecount: Int = 1
  @State var hitcount: Int = 0
  @State var userSet: Int = 0
  @State var arrowSet: Int = 0
  @State var whim: Int = 0
  @State var whim_y: Double = 0
  @State var direction: Double = 0
  
  @UserDefault(key: "total_charenge", defaultValue: 0)
    static var total_charenge: Double
  @UserDefault(key: "total_hit", defaultValue: 0)
    static var total_hit: Double
  @UserDefault(key: "totalRate", defaultValue: 0)
    static var total_rate: Double
  @UserDefault(key: "fivehitCount", defaultValue: 0)
    static var fivehitCount: Int
  
  
  func judge() {
    self.isButton.toggle()
    self.arrowSet = Int.random(in: 1...3)
    self.whim = Int.random(in:1...50)
    if(whim > 35){
      withAnimation{
        self.whim_y = 180
      }
    }
    withAnimation(Animation.easeInOut(duration: 1)){
    if (arrowSet == 1){
      self.direction = -90.0
    }else if (arrowSet == 2){
      self.direction = 180.0
    }else if (arrowSet == 3){
      self.direction = 90.0
    }
      self.whim_y = 0
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      if (self.userSet == self.arrowSet){
        self.gamecount += 1
        self.hitcount += 1
      }else{
        self.gamecount += 1
      }
      GameView.total_charenge += 1
      self.bunki()
      withAnimation{
        self.direction = 0
      }
      self.isButton.toggle()
    }
  }
  
  func bunki() {
    if (gamecount == 6 && hitcount == 5){
      GameView.fivehitCount += 1
      game.fivehit = GameView.fivehitCount
    }else if (gamecount == 6){
      GameView.total_hit += Double(hitcount)
      GameView.total_rate = (GameView.total_hit/GameView.total_charenge)*100
      game.result_rate = Int(GameView.total_rate)
      game.result_total = Int(GameView.total_charenge)
      game.result_hit = Int(GameView.total_hit)
      game.result = self.hitcount
      gamecount = 1
      hitcount = 0
      self.isResult = true
    }
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color("myblue")
        .edgesIgnoringSafeArea(.all)
      VStack {
        Text("CHOOSE a direction")
          .foregroundColor(Color.white)
          .font(.system(size: 40))
          .fontWeight(.bold)
        Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color.white)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .padding(.bottom, 50)
            .clipped()
            .rotationEffect(.degrees(Double(direction)), anchor: .center)
          .rotation3DEffect(.degrees(whim_y), axis: (x:0, y:1, z:0))
      HStack {
      if (isButton){
        Button(action: {
        self.userSet = 1
        self.judge()
        }) {
          Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color("mygreen"))
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .leading)
            .shadow(radius: 7)
            .clipped()
            .rotationEffect(.degrees(270), anchor: .center)
        }
        Button(action: {
          self.userSet = 2
          self.judge()
        }) {
          Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color("mygreen"))
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .leading)
            .shadow(radius: 7)
            .clipped()
            .rotationEffect(.degrees(180), anchor: .center)
        }
        Button(action: {
          self.userSet = 3
          self.judge()
        }) {
          Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color("mygreen"))
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .leading)
            .shadow(radius: 7)
            .clipped()
            .rotationEffect(.degrees(90), anchor: .center)
        }
      }
      }
      .sheet(isPresented: $isResult){
        ResultView().environmentObject(self.game)
      }
      if (isButton != true){
        Spacer()
          .frame(height: 120)
      }
      Text("\(gamecount)  /❺TIME")
        .font(.system(size: 40))
        .foregroundColor(Color.white)
        .fontWeight(.bold)
      }
      }
    }
  }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
      GameView()
        .environmentObject(Game())
    }
}
