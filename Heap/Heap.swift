//
//  Heap.swift
//  Heap
//
//  Created by Mikhail on 29.03.2022.
//

import Foundation

public struct Heap<Element> {
    
    private var elements: [Element]
    private let priority: Priority
    
    public typealias Priority = (Element, Element) -> Bool
    
    // MARK: - Public
    
    public init(priority: @escaping Priority) {
        self.elements = [Element]()
        self.priority = priority
    }
    
    public var top: Element? {
        return elements.first
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public mutating func insert(_ element: Element) {
        elements.append(element)
        heapifyUp(from: count - 1)
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        guard let top = top, let last = elements.last else {
            return nil
        }
        
        elements[0] = last
        elements.removeLast()
        
        heapifyDown(from: 0)
        
        return top
    }
    
    // MARK: - Private
    
    private func parentIndex(for index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftIndex(for index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightIndex(for index: Int) -> Int {
        return 2 * index + 2
    }
    
    private mutating func heapifyUp(from index: Int) {
        let parent = parentIndex(for: index)
        if index > 0, priority(elements[index], elements[parent]) {
            elements.swapAt(index, parent)
            heapifyUp(from: parent)
        }
    }
    
    private func priorityChildIndex(at index: Int) -> Int {
        let left = leftIndex(for: index)
        let right = rightIndex(for: index)
        let count = self.count

        var result = index
        if left < count, priority(elements[left], elements[result]) {
            result = left
        }
        if right < count, priority(elements[right], elements[result]) {
            result = right
        }
        return result
    }
    
    private mutating func heapifyDown(from index: Int) {
        let child = priorityChildIndex(at: index)
        if child != index {
            elements.swapAt(index, child)
            heapifyDown(from: child)
        }
    }
}


extension Heap: Equatable where Element: Equatable {
    
    public static func == (lhs: Heap<Element>, rhs: Heap<Element>) -> Bool {
        return lhs.elements == rhs.elements
    }
}


