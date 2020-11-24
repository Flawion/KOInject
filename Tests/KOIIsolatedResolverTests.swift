//
//  KOIIsolatedResolverTests.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import XCTest
@testable import KOInject

final class KOIIsolatedResolverTests: XCTestCase {
    func testIsolatedResolver() {
        let container = KOIContainer()
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        let testArg6: Bool = true
        let testArg7: Int16 = -434
        let testArg8: UInt16 = 2560
        let testArg9: Int64 = -93
        container.register(forType: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 in
            return TestImplementationArgs9(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
        }
        let lazyResolver = KOILazyResolverArg9(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5, arg6: testArg6, arg7: testArg7, arg8: testArg8, arg9: testArg9)
        
        let isolatedResolver = KOIIsolatedResolver(lazyResolver: lazyResolver)
        XCTAssertNil(lazyResolver.object)
        isolatedResolver.resolve(withAction: { object in
            XCTAssertNotNil(object)
            XCTAssertEqual(testArg1, object?.arg1)
            XCTAssertEqual(testArg2, object?.arg2)
            XCTAssertEqual(testArg3, object?.arg3)
            XCTAssertEqual(testArg4, object?.arg4)
            XCTAssertEqual(testArg5, object?.arg5)
            XCTAssertEqual(testArg6, object?.arg6)
            XCTAssertEqual(testArg7, object?.arg7)
            XCTAssertEqual(testArg8, object?.arg8)
            XCTAssertEqual(testArg9, object?.arg9)
        })
        XCTAssertNil(lazyResolver.object)
    }
}
