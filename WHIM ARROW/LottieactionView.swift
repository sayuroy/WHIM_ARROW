//
//  LottieactionView.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieactionView: UIViewRepresentable  {
  let animationView = AnimationView()
  
  var filename = "sozai04"
  
    
    func makeUIView(context: UIViewRepresentableContext<LottieactionView>) -> UIView {
      
      let view = UIView()
      
      let animation = Animation.named(filename)
      animationView.animation = animation
      animationView.contentMode = .scaleAspectFit
      animationView.play()
      animationView.loopMode = .loop
      
      animationView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(animationView)
      
      NSLayoutConstraint.activate([
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
      
      return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieactionView>) {
      
    }
}

struct LottieactionView_Previews: PreviewProvider {
    static var previews: some View {
      
        LottieactionView()
    }
}
