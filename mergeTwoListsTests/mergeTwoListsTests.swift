//
//  MergeTwoListsTests.swift
//  mergeTwoListsTests
//
//  Created by arifinfrds.engineer on 13/01/23.
//

import XCTest
@testable import mergeTwoLists

// Definition for singly-linked list.
public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list2 == nil {
            return list1
        }
        
        if list1 == nil {
            return list2
        }
        
        guard let list1 = list1, let list2 = list2 else {
            return nil
        }
        
        if list1.val == list2.val {
            return ListNode(1, ListNode(1, nil))
        }
        
        var result = ListNode()
        
        if list1.val < list2.val {
            result = list1
            result.next = mergeTwoLists(list1.next, list2)
        }
        
        return result
    }
}

final class MergeTwoListsTests: XCTestCase {

    func test_mergeTwoLists_returnsNilOnBothListNil() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(nil, nil)
        
        XCTAssertEqual(result, nil)
    }
    
    func test_mergeTwoLists_returnsFirstListOnSecondListIsNil() {
        let firstList = ListNode(1)
        let sut = Solution()
        
        let result = sut.mergeTwoLists(firstList, nil)
        
        XCTAssertEqual(result, firstList)
    }
    
    func test_mergeTwoLists_returnsSecondListOnFirstListIsNil() {
        let secondList = ListNode(1)
        let sut = Solution()
        
        let result = sut.mergeTwoLists(nil, secondList)
        
        XCTAssertEqual(result, secondList)
    }
    
    func test_mergeTwoLists_returnsBothListOnSameValue() {
        let firstList = ListNode(1)
        let secondList = ListNode(1)
        let sut = Solution()
        
        let result = sut.mergeTwoLists(firstList, secondList)
        
        XCTAssertEqual(result, ListNode(1, ListNode(1, nil)))
    }
    
    func test_mergeTwoLists_returnsFirstListThenSecondListOnFirstListIsSmaller() {
        let firstList = ListNode(1)
        let secondList = ListNode(2)
        let sut = Solution()
        
        let result = sut.mergeTwoLists(firstList, secondList)
        
        XCTAssertEqual(result, ListNode(1, ListNode(2, nil)))
    }

}
