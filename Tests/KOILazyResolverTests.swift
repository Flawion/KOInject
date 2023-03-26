//
//  KOILazyResolverTests.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import XCTest
@testable import KOInject

final class KOILazyResolverTests: XCTestCase {
    private var container: KOIContainer!
    
    override func setUpWithError() throws {
        container = KOIContainer()
    }
    
    override func tearDownWithError() throws {
        container = nil
    }
    
    func testLazyResolve() {
        container.register(type: TestProtocol.self, scope:.shared) { resolver in
            return TestImplementation()
        }
        
        let lazyResolver = KOILazyResolver(resolver: container, forType: TestProtocol.self)
        
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg1() {
        let testArg1 = "testArg1"
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1 in
            TestImplementationArgs1(arg1: arg1)
        }
    
        let lazyResolver = KOILazyResolverArg1(resolver: container, forType: TestProtocol.self, arg1: testArg1)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg2() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2 in
            TestImplementationArgs2(arg1: arg1, arg2: arg2)
        }
    
        let lazyResolver = KOILazyResolverArg2(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg3() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3 in
            TestImplementationArgs3(arg1: arg1, arg2: arg2, arg3: arg3)
        }
    
        let lazyResolver = KOILazyResolverArg3(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg4() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4 in
            TestImplementationArgs4(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
        }
    
        let lazyResolver = KOILazyResolverArg4(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg5() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5 in
            TestImplementationArgs5(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
        }
    
        let lazyResolver = KOILazyResolverArg5(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        XCTAssertEqual(testArg5, lazyResolver.object?.arg5)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg6() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        let testArg6: Bool = true
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5, arg6 in
            TestImplementationArgs6(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
        }
    
        let lazyResolver = KOILazyResolverArg6(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5, arg6: testArg6)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        XCTAssertEqual(testArg5, lazyResolver.object?.arg5)
        XCTAssertEqual(testArg6, lazyResolver.object?.arg6)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg7() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        let testArg6: Bool = true
        let testArg7: Int16 = 434
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7 in
            TestImplementationArgs7(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
        }
    
        let lazyResolver = KOILazyResolverArg7(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5, arg6: testArg6, arg7: testArg7)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        XCTAssertEqual(testArg5, lazyResolver.object?.arg5)
        XCTAssertEqual(testArg6, lazyResolver.object?.arg6)
        XCTAssertEqual(testArg7, lazyResolver.object?.arg7)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg8() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        let testArg6: Bool = true
        let testArg7: Int16 = -434
        let testArg8: UInt16 = 2560
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 in
            TestImplementationArgs8(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
        }
    
        let lazyResolver = KOILazyResolverArg8(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5, arg6: testArg6, arg7: testArg7, arg8: testArg8)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        XCTAssertEqual(testArg5, lazyResolver.object?.arg5)
        XCTAssertEqual(testArg6, lazyResolver.object?.arg6)
        XCTAssertEqual(testArg7, lazyResolver.object?.arg7)
        XCTAssertEqual(testArg8, lazyResolver.object?.arg8)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
    
    func testLazyResolveWithArg9() {
        let testArg1 = "testArg1"
        let testArg2: Int = 10
        let testArg3: Double = 3.14
        let testArg4: Float = 2.23
        let testArg5: UInt = 23123213
        let testArg6: Bool = true
        let testArg7: Int16 = -434
        let testArg8: UInt16 = 2560
        let testArg9: Int64 = -93
        container.register(type: TestProtocol.self, scope:.shared) { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 in
            TestImplementationArgs9(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
        }
    
        let lazyResolver = KOILazyResolverArg9(resolver: container, forType: TestProtocol.self, arg1: testArg1, arg2: testArg2, arg3: testArg3, arg4: testArg4, arg5: testArg5, arg6: testArg6, arg7: testArg7, arg8: testArg8, arg9: testArg9)
    
        XCTAssertNil(lazyResolver.object)
        lazyResolver.resolve()
        XCTAssertNotNil(lazyResolver.object)
        XCTAssertEqual(testArg1, lazyResolver.object?.arg1)
        XCTAssertEqual(testArg2, lazyResolver.object?.arg2)
        XCTAssertEqual(testArg3, lazyResolver.object?.arg3)
        XCTAssertEqual(testArg4, lazyResolver.object?.arg4)
        XCTAssertEqual(testArg5, lazyResolver.object?.arg5)
        XCTAssertEqual(testArg6, lazyResolver.object?.arg6)
        XCTAssertEqual(testArg7, lazyResolver.object?.arg7)
        XCTAssertEqual(testArg8, lazyResolver.object?.arg8)
        XCTAssertEqual(testArg9, lazyResolver.object?.arg9)
        lazyResolver.dispose()
        XCTAssertNil(lazyResolver.object)
    }
}
