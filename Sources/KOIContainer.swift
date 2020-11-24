//
//  KOIContainer.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

public final class KOIContainer {
    private let objectStorage: KOIObjectStorage = KOIObjectStorage()
    private var entryForTypes: [KOIType: Any] = [:]
    
    public init() {
    }
}

// MARK: - KOIRegisterProtocol
extension KOIContainer: KOIRegisterProtocol {
    public func register<RegisterType>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, entry: entryForType)
    }

    public func register<RegisterType, Arg1Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self, arg8Type: Arg8Type.self, entry: entryForType)
    }
    
    public func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes = .shared, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type) -> RegisterType) {
        let entryForType = KOIEntry(scope: scope, fabric: fabric)
        register(type: RegisterType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self, arg8Type: Arg8Type.self, arg9Type: Arg9Type.self, entry: entryForType)
    }
    
    private func register(type: Any.Type, arg1Type: Any.Type? = nil, arg2Type: Any.Type? = nil, arg3Type: Any.Type? = nil,
                          arg4Type: Any.Type? = nil, arg5Type: Any.Type? = nil, arg6Type: Any.Type? = nil,
                          arg7Type: Any.Type? = nil, arg8Type: Any.Type? = nil, arg9Type: Any.Type? = nil, entry: Any) {
        let arg1Type = forceTypeOrNil(fromOptional: arg1Type)
        let arg2Type = forceTypeOrNil(fromOptional: arg2Type)
        let arg3Type = forceTypeOrNil(fromOptional: arg3Type)
        let arg4Type = forceTypeOrNil(fromOptional: arg4Type)
        let arg5Type = forceTypeOrNil(fromOptional: arg5Type)
        let arg6Type = forceTypeOrNil(fromOptional: arg6Type)
        let arg7Type = forceTypeOrNil(fromOptional: arg7Type)
        let arg8Type = forceTypeOrNil(fromOptional: arg8Type)
        let arg9Type = forceTypeOrNil(fromOptional: arg9Type)
        let typeToRegister = KOIType(type: type, arg1Type: arg1Type, arg2Type: arg2Type, arg3Type: arg3Type,
                                     arg4Type: arg4Type, arg5Type: arg5Type, arg6Type: arg6Type, arg7Type: arg7Type,
                                     arg8Type: arg8Type, arg9Type: arg9Type)
        entryForTypes[typeToRegister] = entry
        objectStorage.removeCache(forType: typeToRegister)
    }
    
    private func forceTypeOrNil(fromOptional optionalType: Any.Type?) -> Any.Type? {
        return optionalType != nil ? optionalType!.self : nil
    }
}

// MARK: - KOIResolverProtocol
extension KOIContainer: KOIResolverProtocol {
    public func resolve<RegisteredType>() -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type>(arg1: Arg1Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type>(arg1: Arg1Type, arg2: Arg2Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4, arg5)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4, arg5, arg6)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self, arg8Type: Arg8Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
    
    public func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type, arg9: Arg9Type) -> RegisteredType? {
        let registeredType = KOIType(type: RegisteredType.self, arg1Type: Arg1Type.self, arg2Type: Arg2Type.self, arg3Type: Arg3Type.self, arg4Type: Arg4Type.self, arg5Type: Arg5Type.self, arg6Type: Arg6Type.self, arg7Type: Arg7Type.self, arg8Type: Arg8Type.self, arg9Type: Arg9Type.self)
        guard let entryForRegisteredType = entryForTypes[registeredType] as? KOIEntry<(KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type) -> RegisteredType> else {
            return nil
        }
        let createFunc = { () -> RegisteredType in
            return entryForRegisteredType.fabric(self, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
        }
        return objectStorage.object(type: registeredType, inScope: entryForRegisteredType.scope, createFunc: createFunc)
    }
}

// MARK: - KOIDisposableProtocol
extension KOIContainer: KOIDisposableProtocol {
    public func dispose() {
        objectStorage.dispose()
        entryForTypes.removeAll()
    }
}
