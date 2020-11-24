//
//  KOIType.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

struct KOIType: Hashable {
    let type: Any.Type
    let arg1Type: Any.Type?
    let arg2Type: Any.Type?
    let arg3Type: Any.Type?
    let arg4Type: Any.Type?
    let arg5Type: Any.Type?
    let arg6Type: Any.Type?
    let arg7Type: Any.Type?
    let arg8Type: Any.Type?
    let arg9Type: Any.Type?
    
    init(type: Any.Type, arg1Type: Any.Type? = nil, arg2Type: Any.Type? = nil, arg3Type: Any.Type? = nil,
         arg4Type: Any.Type? = nil, arg5Type: Any.Type? = nil, arg6Type: Any.Type? = nil, arg7Type: Any.Type? = nil,
         arg8Type: Any.Type? = nil, arg9Type: Any.Type? = nil) {
        self.type = type
        self.arg1Type = arg1Type
        self.arg2Type = arg2Type
        self.arg3Type = arg3Type
        self.arg4Type = arg4Type
        self.arg5Type = arg5Type
        self.arg6Type = arg6Type
        self.arg7Type = arg7Type
        self.arg8Type = arg8Type
        self.arg9Type = arg9Type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type.self).hashValue)
        hash(into: &hasher, typeIfNeed: arg1Type)
        hash(into: &hasher, typeIfNeed: arg2Type)
        hash(into: &hasher, typeIfNeed: arg3Type)
        hash(into: &hasher, typeIfNeed: arg4Type)
        hash(into: &hasher, typeIfNeed: arg5Type)
        hash(into: &hasher, typeIfNeed: arg6Type)
        hash(into: &hasher, typeIfNeed: arg7Type)
        hash(into: &hasher, typeIfNeed: arg8Type)
        hash(into: &hasher, typeIfNeed: arg9Type)
    }
    
    private func hash(into hasher: inout Hasher, typeIfNeed type: Any.Type?) {
        guard let type = type else {
            return
        }
        hasher.combine(ObjectIdentifier(type.self).hashValue)
    }
    
    static func == (lhs: KOIType, rhs: KOIType) -> Bool {
        return lhs.type == rhs.type &&
            lhs.arg1Type == rhs.arg1Type &&
            lhs.arg2Type == rhs.arg2Type &&
            lhs.arg3Type == rhs.arg3Type &&
            lhs.arg4Type == rhs.arg4Type &&
            lhs.arg5Type == rhs.arg5Type &&
            lhs.arg6Type == rhs.arg6Type &&
            lhs.arg7Type == rhs.arg7Type &&
            lhs.arg8Type == rhs.arg8Type &&
            lhs.arg9Type == rhs.arg9Type
    }
}
