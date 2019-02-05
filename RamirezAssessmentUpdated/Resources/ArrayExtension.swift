//
//  ArrayExtension.swift
//  RamirezAssessmentUpdated
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffleArray1() {
        for index in stride(from: count - 1 , through: 1, by: -1) {
            let random = Int(arc4random_uniform(UInt32(index+1)))
            if index != random {
                self.swapAt(index, random)
            }
        }
    }
}


extension Array {
    mutating func shuffleArray2() {
        for i in stride(from: count - 1, to: 0, by: -1) {
            swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
    }
}

//extension Array {

//    mutating func shuffle() {
//        for i in stride(from: count - 1, to: 0, by: -1) {
//            let j = Int(arc4random_uniform(UInt32(i + 1)))
//            (self[i], self[j]) = (self[j], self[i])
//        }
//    }
//}
