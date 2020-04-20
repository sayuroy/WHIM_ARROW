//
//  DatamanageView.swift
//  WHIM ARROW
//
//  Created by 堀越さゆり on 2020/04/20.
//  Copyright © 2020 sayuri horikoshi. All rights reserved.
//

import SwiftUI

@propertyWrapper
struct UserDefault<T> {
  var key: String
  var defaultValue: T
  var wrappedValue: T {
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
    get {
      UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
  }
}
