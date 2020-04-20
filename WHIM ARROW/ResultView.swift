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
          Spacer()
        }
      }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
      .environmentObject(Game())
    }
}
