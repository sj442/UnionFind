//
//  QuickUnion.swift
//  UnionFindAlgorithm
//
//  Created by Sunayna Jain on 7/18/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class QuickUnion: NSObject {
  
  let numberOfObjects: Int
  
  var objects: [Int]
  
  // N array accesses
  init(withObjects count: Int) {
    self.numberOfObjects = count
    self.objects = [Int]()
    for i in 0..<count - 1 {
      objects.append(i)
    }
  }
  
  // depth of n array accesses
  private func root(n: Int) -> Int {
    var x = n
    while x != objects[x] {
      x = objects[x]
    }
    return x
  }
  
  // depth of p and q array accesses
  func connected(p: Int, q: Int) -> Bool {
    return root(p) == root(q)
  }

  // depth of p and q array accesses
  func union(p: Int, q: Int) {
    let rootP = root(p)
    let rootQ = root(q)
    objects[rootP] = rootQ
  }

}
