//
//  ShareData.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import Foundation

class Game: ObservableObject {
  @Published var result: Int = 0
  
  @Published var result_total: Int = 0
  @Published var result_hit: Int = 0
  @Published var result_rate: Int = 0
  @Published var fivehit: Int = 0
}
