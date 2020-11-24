//
//  KOIContainerTests.swift
//  KOIContainerTests
//
//  Created by Kuba Ostrowski on 30/10/2020.
//

import XCTest
@testable import KOInject

final class KOIContainerTests: XCTestCase {

    func testRegister() {
        let container = KOIContainer()
        
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        let implementation: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(implementation)
    }
    
    func testOverrideRegister() {
        let container = KOIContainer()
        
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation2()
        })
        let implementation: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(implementation)
        XCTAssert(implementation is TestImplementation2)
    }
    
    func testOverrideRegisterAfterResolve() {
        let container = KOIContainer()
        
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        let _: TestProtocol? = container.resolve()
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation2()
        })
        let implementation: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(implementation)
        XCTAssert(implementation is TestImplementation2)
    }
    
    func testResolveNotRegistered() {
        let container = KOIContainer()
        
        let implementation: TestProtocol? = container.resolve()
        
        XCTAssertNil(implementation)
    }
    
    func testResolveLazy() {
       /* let container = KOIOCContainer()
        
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        let lazyImplementation = container.resolveLazy()
        lazyImplementation.resolve()
        lazyImplementation.implementation
        lazyImplementation.dispose()*/
    }
}


private protocol TestProtocol {
    
}

private final class TestImplementation: TestProtocol {
    
}

private final class TestImplementation2: TestProtocol {
    
}
