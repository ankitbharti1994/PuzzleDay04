//: Playground - noun: a place where people can play

import Foundation
import XCTest
import PlaygroundSupport

                                                                /* Part 1*/

class Day04PuzzleTest: XCTestCase {
    
    func testForValidPassphrase() {
        XCTAssertTrue("aa bb cc dd ee".isValidPassphrase)
        XCTAssertFalse("aa bb cc dd aa".isValidPassphrase)
        XCTAssertTrue("aa bb cc dd aaa".isValidPassphrase)
        XCTAssertFalse("".isValidPassphrase)
    }
    
    func testForNumberOfValidPassphraseFromSampleInputFile() {
        let passphraseExpectation = expectation(description: "passphrase expection")
        
        validPassphraseCount(fileName: "SampleInput") {
            XCTAssertEqual($0, 2, "valid passphrase from sample input file should be \($0)")
            passphraseExpectation.fulfill()
        }
        
        wait(for: [passphraseExpectation], timeout: 1)
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true


let day04PuzzleTest = Day04PuzzleTest()
day04PuzzleTest.testForValidPassphrase()
day04PuzzleTest.testForNumberOfValidPassphraseFromSampleInputFile()

validPassphraseCount(fileName: "Input") {
    print($0)
}

                                                                /* Part 2 */

extension Day04PuzzleTest {
    func testForIsRearrangeValidPassphrase() {
        XCTAssertFalse("abcde fghij".canRearrange)
        XCTAssertTrue("abcde xyz ecdab".canRearrange)
        XCTAssertFalse("a ab abc abd abf abj".canRearrange)
        XCTAssertFalse("iiii oiii ooii oooi oooo".canRearrange)
        XCTAssertTrue("oiii ioii iioi iiio".canRearrange)
    }
    
    func testForNumberOfValidPassphraseWithoutRearrangeFromSampleInputFile() {
        let passphraseExpectation = expectation(description: "passphrase expection without Rearrange")
        
        validPassphraseWithoutRearrangeCount(fileName: "SampleInput01") {
            XCTAssertEqual($0, 3, "valid passphrase from sample input file should be \($0)")
            passphraseExpectation.fulfill()
        }
        
        wait(for: [passphraseExpectation], timeout: 1)
    }
}

day04PuzzleTest.testForIsRearrangeValidPassphrase()
day04PuzzleTest.testForNumberOfValidPassphraseWithoutRearrangeFromSampleInputFile()

validPassphraseWithoutRearrangeCount(fileName: "Input") {
    print("\($0)")
}
