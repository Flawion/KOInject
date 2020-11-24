//
//  KOILazyResolver.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

public class KOILazyResolver<RegisterType>: KOIDisposableProtocol {
    let resolver: KOIResolverProtocol
    public var object: RegisterType?
    
    public init(resolver: KOIResolverProtocol, forType _: RegisterType.Type) {
        self.resolver = resolver
    }
    
    public func resolve() {
        object = resolver.resolve()
    }
    
    public func dispose() {
        object = nil
    }
}

public class KOILazyResolverArg1<RegisterType, Arg1Type>: KOILazyResolver<RegisterType> {
    let arg1: Arg1Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type) {
        self.arg1 = arg1
        super.init(resolver: resolver, forType: tye)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1)
    }
}

public class KOILazyResolverArg2<RegisterType, Arg1Type, Arg2Type>: KOILazyResolverArg1<RegisterType, Arg1Type> {
    let arg2: Arg2Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type) {
        self.arg2 = arg2
        super.init(resolver: resolver, forType: tye, arg1: arg1)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2)
    }
}

public class KOILazyResolverArg3<RegisterType, Arg1Type, Arg2Type, Arg3Type>: KOILazyResolverArg2<RegisterType, Arg1Type, Arg2Type> {
    let arg3: Arg3Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type) {
        self.arg3 = arg3
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3)
    }
}

public class KOILazyResolverArg4<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type>: KOILazyResolverArg3<RegisterType, Arg1Type, Arg2Type, Arg3Type> {
    let arg4: Arg4Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type) {
        self.arg4 = arg4
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
    }
}

public class KOILazyResolverArg5<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type>: KOILazyResolverArg4<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type> {
    let arg5: Arg5Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type) {
        self.arg5 = arg5
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
    }
}

public class KOILazyResolverArg6<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type>: KOILazyResolverArg5<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type> {
    let arg6: Arg6Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type) {
        self.arg6 = arg6
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
    }
}

public class KOILazyResolverArg7<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type>: KOILazyResolverArg6<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type> {
    let arg7: Arg7Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type) {
        self.arg7 = arg7
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
    }
}

public class KOILazyResolverArg8<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type>: KOILazyResolverArg7<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type> {
    let arg8: Arg8Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type) {
        self.arg8 = arg8
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
    }
}

public class KOILazyResolverArg9<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type, Arg9Type>: KOILazyResolverArg8<RegisterType, Arg1Type, Arg2Type, Arg3Type, Arg4Type, Arg5Type, Arg6Type, Arg7Type, Arg8Type> {
    let arg9: Arg9Type
    
    public init(resolver: KOIResolverProtocol, forType tye: RegisterType.Type, arg1: Arg1Type, arg2: Arg2Type, arg3: Arg3Type, arg4: Arg4Type, arg5: Arg5Type, arg6: Arg6Type, arg7: Arg7Type, arg8: Arg8Type, arg9: Arg9Type) {
        self.arg9 = arg9
        super.init(resolver: resolver, forType: tye, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8)
    }
    
    public override func resolve() {
        object = resolver.resolve(arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9)
    }
}
