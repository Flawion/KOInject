//
//  KOIIsolatedResolver.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

public final class KOIIsolatedResolver<RegisterType> {
    private let lazyResolver: KOILazyResolver<RegisterType>
    
    public init(lazyResolver: KOILazyResolver<RegisterType>) {
        self.lazyResolver = lazyResolver
    }
    
    public func resolve(withAction action: (RegisterType?)-> Void) {
        lazyResolver.resolve()
        action(lazyResolver.object)
        lazyResolver.dispose()
    }
}
