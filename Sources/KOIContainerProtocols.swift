//
//  KOIContainerProtocols.swift
//  KOInjectTests
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

public protocol KOIRegisterProtocol {
    func register<RegisterType>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol) -> RegisterType)
    
    func register<RegisterType, Arg1Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type, Arg8Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type, Arg8Type) -> RegisterType)
    
    func register<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type, Arg8Type, Arg9Type>(forType type: RegisterType.Type, scope: KOIObjectLifeScopes, fabric: @escaping (KOIResolverProtocol, Arg1Type, Arg2Type, Arg3Type, Arg4Type, ArgType5, Arg6Type, Arg7Type, Arg8Type, Arg9Type) -> RegisterType)
}

public protocol KOIResolverProtocol {
    func resolve<RegisteredType>() -> RegisteredType?
    
    func resolve<RegisteredType, Arg1>(arg1: Arg1) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type>(arg1: Arg1Type, arg2: Arg2Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type) -> RegisteredType?
    
    func resolve<RegisteredType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type>(arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type, arg9: Arg9Type) -> RegisteredType?
}

public protocol KOIDisposableProtocol {
    func dispose()
}
