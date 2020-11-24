//
//  KOIObjectStorage.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

final class KOIObjectStorage {
    private var sharedObjects: [KOIType: KOIObjectStorageItemProtocol] = [:]
    
    func removeCache(forType type: KOIType) {
        sharedObjects.removeValue(forKey: type)
    }
    
    func object<RegisteredType>(type: KOIType, inScope scope: KOIObjectLifeScopes, createFunc: () -> RegisteredType) -> RegisteredType {
        switch scope {
        case .shared:
            return objectShared(type: type, createFunc: createFunc)
            
        case .weakShared:
            return objectWeakShared(type: type, createFunc: createFunc)
            
        case .separate:
            return createFunc()
        }
    }
    
    private func objectShared<RegisteredType>(type: KOIType, createFunc: () -> RegisteredType) -> RegisteredType {
        var object = sharedObjects[type]?.object as? RegisteredType
        if object == nil {
            object = createFunc()
            sharedObjects[type] = KOIObjectStorageItem(object: object!)
        }
        return object!
    }
    
    private func objectWeakShared<RegisteredType>(type: KOIType, createFunc: () -> RegisteredType) -> RegisteredType {
        var object = sharedObjects[type]?.object as? RegisteredType
        if object == nil {
            object = createFunc()
            sharedObjects[type] = KOIObjectStorageWeakItem(object: object!)
        }
        return object!
    }
}

extension KOIObjectStorage: KOIDisposableProtocol {
    func dispose() {
        sharedObjects.removeAll()
    }
}
