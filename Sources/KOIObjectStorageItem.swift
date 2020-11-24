//
//  KOIObjectStorageItem.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

protocol KOIObjectStorageItemProtocol {
    var object: Any? { get set }
    
    init(object: Any)
}

struct KOIObjectStorageItem: KOIObjectStorageItemProtocol {
    var object: Any?
    
    init(object: Any) {
        self.object = object
    }
}

struct KOIObjectStorageWeakItem: KOIObjectStorageItemProtocol {
    private weak var weakObject: AnyObject?
    
    var object: Any? {
        get {
            return weakObject
        }
        set {
            weakObject = newValue as AnyObject
        }
    }
    
    init(object: Any) {
        self.object = object
    }
}
