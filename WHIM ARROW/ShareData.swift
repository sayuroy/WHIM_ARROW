//
//  ShareData.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import Foundation

class Game: ObservableObject {
  @Published var passcount: Int = 0
  @Published var gamecount: Int = 1
  @Published var result: Int = 0
}
