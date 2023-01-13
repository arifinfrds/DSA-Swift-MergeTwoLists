//
//  mergeTwoListsTests.swift
//  mergeTwoListsTests
//
//  Created by arifinfrds.engineer on 13/01/23.
//

import XCTest
@testable import mergeTwoLists

// Definition for singly-linked list.
public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
    
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

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        return nil
    }
}

final class mergeTwoListsTests: XCTestCase {

    func test_mergeTwoLists_returnsNilOnBothListNil() {
        let sut = Solution()
        
        let result = sut.mergeTwoLists(nil, nil)
        
        XCTAssertEqual(result, nil)
    }

}
