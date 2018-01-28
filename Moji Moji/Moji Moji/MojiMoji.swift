//
//  MojiMoji.swift
//  Moji Moji
//
//  Created by James on 28/1/18.
//  Copyright © 2018 Front end iOS Developer. All rights reserved.
//

import UIKit

struct MojiMoji {
    var uuid: String
    var emojis: [String: Int]
    var passEmojis: [String]
}

extension URL {
    var parseQueryString: [String: String] {
        var results = [String: String]()
        
        if let pairs = self.query?.components(separatedBy: "&"),  pairs.count > 0 {
            for pair: String in pairs {
                if let keyValue = pair.components(separatedBy: "=") as [String]? {
                    results.updateValue(keyValue[1], forKey: keyValue[0])
                }
            }
        }
        return results
    }
}
