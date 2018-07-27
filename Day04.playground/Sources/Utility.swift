//
//  Utility.swift
//  Lister
//
//  Created by Ankit Kumar Bharti on 27/07/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

fileprivate func readTextFromInputFile(name: String) -> [String] {
    
    guard let fileURL = Bundle.main.url(forResource: name, withExtension: "txt") else { return [] }
    do {
        let data = try Data(contentsOf: fileURL)
        guard let inputString = String(data: data, encoding: .utf8) else { return [] }
        return inputString.components(separatedBy: "\n")
    }catch {
        return []
    }
}

public func validPassphraseCount(fileName: String,_ result: @escaping (Int) -> ()) {
    DispatchQueue.global(qos: .utility).async {
        let stringList = readTextFromInputFile(name: fileName)
        let passphraseList = stringList.filter {
            return $0.isValidPassphrase
        }
        result(passphraseList.count)
    }
}

public func validPassphraseWithoutRearrangeCount(fileName: String,_ result: @escaping (Int) -> ()) {
    DispatchQueue.global(qos: .utility).async {
        let stringList = readTextFromInputFile(name: fileName)
        let passphraseList = stringList.filter {
            return $0.isValidPassphrase && !$0.canRearrange
        }
        result(passphraseList.count)
    }
}
