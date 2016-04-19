//
//  TestSwift.swift
//  OCAddSwift
//
//  Created by JL on 16/4/11.
//  Copyright © 2016年 Youths. All rights reserved.
//

import Foundation

class TestSwift: NSObject {
    func test() -> String {
        return "test";
    }
    
    func testNew() {
        let test1 = TestData();
        print(test1.testNumber);
    }
}
