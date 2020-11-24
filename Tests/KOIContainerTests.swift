//
//  KOIContainerTests.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import XCTest
@testable import KOInject

final class KOIContainerTests: XCTestCase {
    private var container: KOIContainer!
    
    override func setUpWithError() throws {
        container = KOIContainer()
    }
    
    override func tearDownWithError() throws {
        container = nil
    }
    
    func testRegister() {
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        let object: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(object)
    }
    
    func testOverrideRegister() {
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestOverrideImplementation()
        })
        let object: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(object)
        XCTAssert(object is TestOverrideImplementation)
    }
    
    func testOverrideRegisterAfterResolve() {
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestImplementation()
        })
        let _: TestProtocol? = container.resolve()
        container.register(forType: TestProtocol.self, fabric: { resolver in
            return TestOverrideImplementation()
        })
        let object: TestProtocol? = container.resolve()
        
        XCTAssertNotNil(object)
        XCTAssert(object is TestOverrideImplementation)
    }
    
    func testResolveNotRegistered() {
        let object: TestProtocol? = container.resolve()
        
        XCTAssertNil(object)
    }
    
    func testRegisterSeparate() {
        container.register(forType: TestProtocol.self, scope:.separate) { resolver in
            return TestImplementation()
        }
        let object1: TestProtocol? = container.resolve()
        let object2: TestProtocol? = container.resolve()
        let object1Casted = object1 as? TestImplementation
        let object2Casted = object2 as? TestImplementation
        
        XCTAssertNotNil(object1Casted)
        XCTAssertNotNil(object2Casted)
        XCTAssert(object1Casted !== object2Casted)
    }
    
    func testDispose() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2 in
            return TestImplementationArgs2(arg1: arg1, arg2: arg2)
        })
        var testProtocol: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2)
        XCTAssertNotNil(testProtocol)
        container.dispose()
        
        testProtocol = container.resolve(arg1: arg1, arg2: arg2)
        XCTAssertNil(testProtocol)
    }
    
    func testRegisterWithArg1() {
        let arg1: String = "testArg"
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1 in
            return TestImplementationArgs1(arg1: arg1)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
    }
    
    func testResolveNotRegisteredWithArg1() {
        let arg1: String = "testArg"
        
        let object: TestProtocol? = container.resolve(arg1: arg1)
        
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg2() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2 in
            return TestImplementationArgs2(arg1: arg1, arg2: arg2)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
    }
    
    func testResolveNotRegisteredWithArg2() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2)
        
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg3() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.0
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3 in
            return TestImplementationArgs3(arg1: arg1, arg2: arg2, arg3: arg3)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
    }
    
    func testResolveNotRegisteredWithArg3() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.0
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3)
        
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg4() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4 in
            return TestImplementationArgs4(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
    }
    
    func testResolveNotRegisteredWithArg4() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
        
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg5() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4, arg5 in
            return TestImplementationArgs5(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
       
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
        XCTAssertEqual(object?.arg5, arg5)
    }
    
    func testResolveNotRegisteredWithArg5() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
       
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg6() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4, arg5, arg6 in
            return TestImplementationArgs6(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
       
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
        XCTAssertEqual(object?.arg5, arg5)
        XCTAssertEqual(object?.arg6, arg6)
    }
    
    func testResolveNotRegisteredWithArg6() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
       
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg7() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = 8485
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7 in
            return TestImplementationArgs7(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
        XCTAssertEqual(object?.arg5, arg5)
        XCTAssertEqual(object?.arg6, arg6)
        XCTAssertEqual(object?.arg7, arg7)
    }
    
    func testResolveNotRegisteredWithArg7() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = 8485
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
        
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg8() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = -8485
        let arg8: UInt16 = 2343
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 in
            return TestImplementationArgs8(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
  
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
        XCTAssertEqual(object?.arg5, arg5)
        XCTAssertEqual(object?.arg6, arg6)
        XCTAssertEqual(object?.arg7, arg7)
        XCTAssertEqual(object?.arg8, arg8)
    }
    
    func testResolveNotRegisteredWithArg8() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = -8485
        let arg8: UInt16 = 2343
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
  
        XCTAssertNil(object)
    }
    
    func testRegisterWithArg9() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = -8485
        let arg8: UInt16 = 2343
        let arg9: Int64 = -23
        
        container.register(forType: TestProtocol.self, fabric: { resolver, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 in
            return TestImplementationArgs9(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
        })
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
        
        XCTAssertNotNil(object)
        XCTAssertEqual(object?.arg1, arg1)
        XCTAssertEqual(object?.arg2, arg2)
        XCTAssertEqual(object?.arg3, arg3)
        XCTAssertEqual(object?.arg4, arg4)
        XCTAssertEqual(object?.arg5, arg5)
        XCTAssertEqual(object?.arg6, arg6)
        XCTAssertEqual(object?.arg7, arg7)
        XCTAssertEqual(object?.arg8, arg8)
        XCTAssertEqual(object?.arg9, arg9)
    }
    
    func testResolveNotRegisteredWithArg9() {
        let arg1: String = "testArg"
        let arg2: Int = 10
        let arg3: Double = 10.5
        let arg4: Float = 5.23
        let arg5: UInt = 12300
        let arg6: Bool = true
        let arg7: Int16 = -8485
        let arg8: UInt16 = 2343
        let arg9: Int64 = -23
        
        let object: TestProtocol? = container.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
        
        XCTAssertNil(object)
    }
}
