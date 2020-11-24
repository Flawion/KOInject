//
//  TestImplementations.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

protocol TestProtocol {
    var arg1: String? { get }
    var arg2: Int? { get }
    var arg3: Double? { get }
    var arg4: Float? { get }
    var arg5: UInt? { get }
    var arg6: Bool? { get }
    var arg7: Int16? { get }
    var arg8: UInt16? { get }
    var arg9: Int64? { get }
}

class TestImplementation: TestProtocol {
    
    var arg1: String? {
        return nil
    }
    
    var arg2: Int? {
        return nil
    }
    
    var arg3: Double? {
        return nil
    }
    
    var arg4: Float? {
        return nil
    }
    
    var arg5: UInt? {
        return nil
    }
    
    var arg6: Bool? {
        return nil
    }
    
    var arg7: Int16? {
        return nil
    }
    
    var arg8: UInt16? {
        return nil
    }
    
    var arg9: Int64? {
        return nil
    }
}

class TestOverrideImplementation: TestImplementation {
}

class TestImplementationArgs1: TestImplementation {
    private let pArg1: String?
    
    override var arg1: String? {
        return pArg1
    }
    
    init(arg1: String) {
        self.pArg1 = arg1
    }
}

class TestImplementationArgs2: TestImplementationArgs1 {
    private let pArg2: Int?
    
    override var arg2: Int? {
        return pArg2
    }
    
    init(arg1: String, arg2: Int) {
        self.pArg2 = arg2
        super.init(arg1: arg1)
    }
}

class TestImplementationArgs3: TestImplementationArgs2 {
    private let pArg3: Double
    
    override var arg3: Double? {
        return pArg3
    }
    
    init(arg1: String, arg2: Int, arg3: Double) {
        self.pArg3 = arg3
        super.init(arg1: arg1, arg2: arg2)
    }
}

class TestImplementationArgs4: TestImplementationArgs3 {
    private let pArg4: Float
    
    override var arg4: Float? {
        return pArg4
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float) {
        self.pArg4 = arg4
        super.init(arg1: arg1, arg2: arg2, arg3: arg3)
    }
}


class TestImplementationArgs5: TestImplementationArgs4 {
    private let pArg5: UInt
    
    override var arg5: UInt? {
        return pArg5
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float, arg5: UInt) {
        self.pArg5 = arg5
        super.init(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
    }
}

class TestImplementationArgs6: TestImplementationArgs5 {
    private let pArg6: Bool
    
    override var arg6: Bool? {
        return pArg6
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float, arg5: UInt, arg6: Bool) {
        self.pArg6 = arg6
        super.init(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
    }
}

class TestImplementationArgs7: TestImplementationArgs6 {
    private let pArg7: Int16
    
    override var arg7: Int16? {
        return pArg7
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float, arg5: UInt, arg6: Bool, arg7: Int16) {
        self.pArg7 = arg7
        super.init(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
    }
}

class TestImplementationArgs8: TestImplementationArgs7 {
    private let pArg8: UInt16
    
    override var arg8: UInt16? {
        return pArg8
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float, arg5: UInt, arg6: Bool, arg7: Int16, arg8: UInt16) {
        self.pArg8 = arg8
        super.init(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
    }
}

final class TestImplementationArgs9: TestImplementationArgs8 {
    private let pArg9: Int64
    
    override var arg9: Int64? {
        return pArg9
    }
    
    init(arg1: String, arg2: Int, arg3: Double, arg4: Float, arg5: UInt, arg6: Bool, arg7: Int16, arg8: UInt16, arg9: Int64) {
        self.pArg9 = arg9
        super.init(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
    }
}
