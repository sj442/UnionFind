//
//  UnionFind.swift
//  UnionFindAlgorithm
//
//  Created by Sunayna Jain on 7/18/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class QuickFind: NSObject {
  
  let numberOfObjects: Int
  
  var objects: [Int]
  
  //array accesses for initialize: N
  //                        union: N
  //                         find: 1
  
  // N^2 array accesses to process sequence of N union commnads on N objects
  init(withObjects count: Int) {
    self.numberOfObjects = count
    self.objects = [Int]()
    for i in 0..<count - 1 {
      objects.append(i)
    }
  }
  
  func union(p: Int, q: Int) {
    let v1 = objects[p]
    let v2 = objects[q]
    for (i, index) in objects.enumerate() {
      if i == v1 {
        objects[index] = v2
      }
    }
  }
  
  func connected(p: Int, q: Int) -> Bool {
    return objects[p] == objects[q]
  }

}
