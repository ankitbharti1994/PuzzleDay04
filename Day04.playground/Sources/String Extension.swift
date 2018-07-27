//
//  Extension.swift
//  Lister
//
//  Created by Ankit Kumar Bharti on 27/07/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

public extension String {
    public var isValidPassphrase: Bool {
        let originalTextCollection = self.components(separatedBy: " ")
        guard originalTextCollection.count > 1 else {
            return false
        }
        let uniqueTextCollection = Set(originalTextCollection)
        return originalTextCollection.count == uniqueTextCollection.count
    }
    
    public var canRearrange: Bool {
        
        let textCollection = self.components(separatedBy: " ")
        guard textCollection.count > 1 else { return false } // TODO:- Remove this line
        guard textCollection.count == 2 else {
                      
            for index0 in 0..<textCollection.count {
                for index1 in (index0 + 1)..<textCollection.count {
                    if textCollection[index0].characterSet.sorted() == textCollection[index1].characterSet.sorted() {
                        return true
                    }
                }
            }
            
            return false
        }
        return textCollection.first!.characterSet == textCollection.last!.characterSet
    }
    
    public var characterSet: [Character] {
        var char = [Character]()
        for character in self {
            char.append(character)
        }
        return char
    }
}
