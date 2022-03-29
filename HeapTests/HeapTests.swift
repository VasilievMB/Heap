//
//  HeapTests.swift
//  HeapTests
//
//  Created by Mikhail on 29.03.2022.
//

import XCTest
@testable import Heap

class HeapTests: XCTestCase {

    func testInsert() throws {
        var minHeap = Heap<Int>(priority: <)
        
        XCTAssertTrue(minHeap.isEmpty)
        XCTAssertEqual(minHeap.count, 0)
        
        minHeap.insert(10)
        
        XCTAssertEqual(minHeap.count, 1)
        XCTAssertEqual(minHeap.top, 10)
        
        minHeap.insert(5)
        
        XCTAssertEqual(minHeap.count, 2)
        XCTAssertEqual(minHeap.top, 5)
        
        minHeap.insert(1)
        
        XCTAssertEqual(minHeap.count, 3)
        XCTAssertEqual(minHeap.top, 1)
        
        minHeap.insert(2)
        
        XCTAssertEqual(minHeap.count, 4)
        XCTAssertEqual(minHeap.top, 1)
    }
    
    func testRemove() {
        var minHeap = Heap<Int>(priority: <)
        
        XCTAssertNil(minHeap.remove())
        
        minHeap.insert(1)
        
        XCTAssertEqual(minHeap.remove(), 1)
        XCTAssertTrue(minHeap.isEmpty)
        
        minHeap.insert(10)
        minHeap.insert(4)
        minHeap.insert(1)
        minHeap.insert(20)
        minHeap.insert(7)
        
        XCTAssertEqual(minHeap.remove(), 1)
        XCTAssertEqual(minHeap.remove(), 4)
        XCTAssertEqual(minHeap.remove(), 7)
        XCTAssertEqual(minHeap.remove(), 10)
        XCTAssertEqual(minHeap.remove(), 20)
        XCTAssertNil(minHeap.remove())
    }
    
}
