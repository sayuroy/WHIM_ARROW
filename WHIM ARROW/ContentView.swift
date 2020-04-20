//
//  ContentView.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    NavigationView {
      ZStack(alignment: .bottom){
        Color("myblue")
          .edgesIgnoringSafeArea(.all)
        LottieactionView()
          .frame(width: 110, height: 110)
          .offset(x: 80, y: -30)
      VStack {
          VStack(alignment: .trailing) {
          Text("WHIM ARROW!")
            .font(.system(size: 60))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        }
        VStack {
          Image(systemName: "shift")
            .resizable()
            .foregroundColor(Color.white)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
        }
        .padding(.bottom, 50)
        NavigationLink(destination: GameView()){
            Text("PLAY")
              .font(.system(size: 40))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
              .padding(50)
        }
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
