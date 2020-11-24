//
//  KOITypeTests.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import XCTest
@testable import KOInject

final class KOITypeTests: XCTestCase {
    
    func testDifference() {
        let type1 = KOIType(type: TestProtocol.self)
        let type2 = KOIType(type: TestProtocol2.self)
        
        XCTAssertNotEqual(type1.hashValue, type2.hashValue)
        XCTAssertNotEqual(type1, type2)
    }
    
    func testSameTypeOtherArg1Difference() {
        let type = KOIType(type: TestProtocol.self)
        let typeArg1 = KOIType(type: TestProtocol.self, arg1Type: String.self)
        
        XCTAssertNotEqual(type.hashValue, typeArg1.hashValue)
        XCTAssertNotEqual(type, typeArg1)
    }
    
    func testSameTypeEquality() {
        let type1 = KOIType(type: TestProtocol.self)
        let type2 = KOIType(type: TestProtocol.self)
        
        XCTAssertEqual(type1.hashValue, type2.hashValue)
        XCTAssertEqual(type1, type2)
    }
    
    func testSameTypeWithArg1Equality() {
        let typeArg1 = KOIType(type: TestProtocol.self, arg1Type: String.self)
        let typeArg2 = KOIType(type: TestProtocol.self, arg1Type: String.self)
        
        XCTAssertEqual(typeArg1.hashValue, typeArg2.hashValue)
        XCTAssertEqual(typeArg1, typeArg2)
    }
}

private protocol TestProtocol2 {
    
}
