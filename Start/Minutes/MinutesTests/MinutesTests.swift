//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Mostafa Sandeed on 4/21/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTest: Entry!

    override func setUp() {
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        entryUnderTest = nil
        super.tearDown()
    }

    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let deserializedEntry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(deserializedEntry?.title, "Title", "Title does not match")
        XCTAssertEqual(deserializedEntry?.content, "Content", "Content does not match")
    }

}
