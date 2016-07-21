//
//  WeigthedQuickUnion.swift
//  UnionFindAlgorithm
//
//  Created by Sunayna Jain on 7/19/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class WeigthedQuickUnion: NSObject {
  
  // depth of any node is at most log (base 2) N, where N is the number of objects
  
  //array accesses for initialize: N
  //                        union: lg N
  //                         find: lg N
  
  let numberOfObjects: Int
  
  var objects: [Int]
  
  var sizeArray: [Int]
  
  // N array accesses
  init(withObjects count: Int) {
    self.numberOfObjects = count
    self.objects = [Int]()
    self.sizeArray = [Int]()
    for i in 0..<count - 1 {
      objects.append(i)
      sizeArray.append(1)
    }
  }
  
  private func root(n: Int) -> Int {
    var x = n
    while x != objects[x] {
      x = objects[x]
    }
    return x
  }
  
  func connected(p: Int, q: Int) -> Bool {
    return root(p) == root(q)
  }
  
  func union(p: Int, q: Int) {
    let rootP = root(p)
    let rootQ = root(q)
    let pCount = sizeArray[rootP]
    let qCount = sizeArray[rootQ]
    if pCount > qCount {
      objects[rootQ] = rootP
      sizeArray[rootP] = pCount + qCount
    } else {
      objects[rootP] = rootQ
      sizeArray[rootQ] = pCount + qCount
    }
  }
  

}
