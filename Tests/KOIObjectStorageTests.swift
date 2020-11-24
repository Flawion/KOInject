//
//  KOIObjectStorageTests.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import XCTest
@testable import KOInject

final class KOIObjectStorageTests: XCTestCase {
    private var container: KOIContainer!
    private var objectStorage: KOIObjectStorage!
    
    override func setUpWithError() throws {
        container = KOIContainer()
        objectStorage = KOIObjectStorage()
    }

    override func tearDownWithError() throws {
        container = KOIContainer()
        objectStorage = nil
    }
    
    func testResolveSharedEntry() {
        let type = KOIType(type: TestProtocol.self)
        let entry = KOIEntry(scope: .shared) { (resolver: KOIResolverProtocol) -> TestProtocol in
            return TestImplementation()
        }
        let createFunc = { () -> TestProtocol in
            return entry.fabric(self.container)
        }
        
        let object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc)  as? TestImplementation
        let object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementation
        
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssert(object1 === object2)
    }
    
    func testResolveSharedArg1Entry() {
        let type = KOIType(type: TestProtocol.self, arg1Type: String.self)
        let entry = KOIEntry(scope: .shared) { (resolver: KOIResolverProtocol, arg1: String) -> TestProtocol in
            return TestImplementationArgs1(arg1: arg1)
        }
        let arg1 = "testArg1"
        let createFunc = { () -> TestProtocol in
            return entry.fabric(self.container, arg1)
        }

        let object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc)  as? TestImplementationArgs1
        let object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssertEqual(object1?.arg1, arg1)
        XCTAssert(object1 === object2)
    }
    
    func testResolveWeakSharedEntry() {
        let type = KOIType(type: TestProtocol.self)
        let arg = "testArg"
        let entry = KOIEntry(scope: .weakShared) { (resolver: KOIResolverProtocol, arg1: String) -> TestProtocol in
            return TestImplementationArgs1(arg1: arg1)
        }
        var createFuncRunCounter: Int = 0
        let createFunc = { () -> TestProtocol in
            createFuncRunCounter += 1
            return entry.fabric(self.container, arg)
        }
        
        var object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        var object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssertEqual(createFuncRunCounter, 1)
        XCTAssert(object1 === object2)
        object1 = nil
        object2 = nil
        
        object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssertEqual(createFuncRunCounter, 2)
        XCTAssert(object1 === object2)
    }

    func testResolveSeparateEntry() {
        let type = KOIType(type: TestProtocol.self)
        let entry = KOIEntry(scope: .separate) { (resolver: KOIResolverProtocol) -> TestProtocol in
            return TestImplementation()
        }
        let createFunc = { () -> TestProtocol in
            return entry.fabric(self.container)
        }

        let object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc)  as? TestImplementation
        let object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementation
        
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssert(object1 !== object2)
    }
    
    func testResolveSeparateArg1Entry() {
        let type = KOIType(type: TestProtocol.self, arg1Type: String.self)
        let arg1 = "testArg1"
        let entry = KOIEntry(scope: .separate) { (resolver: KOIResolverProtocol, arg1: String) -> TestProtocol in
            return TestImplementationArgs1(arg1: arg1)
        }
        let createFunc = { () -> TestProtocol in
            return entry.fabric(self.container, arg1)
        }
        
        let object1 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc)  as? TestImplementationArgs1
        let object2 = objectStorage.object(type: type, inScope: entry.scope, createFunc: createFunc) as? TestImplementationArgs1
        
        XCTAssertNotNil(object1)
        XCTAssertNotNil(object2)
        XCTAssertEqual(object1?.arg1, arg1)
        XCTAssert(object1 !== object2)
    }
}
