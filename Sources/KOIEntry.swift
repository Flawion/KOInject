//
//  KOISharedEntry.swift
//  KOInject
//
//  Copyright (c) 2020 Kuba Ostrowski
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.

import Foundation

public enum KOIObjectLifeScopes {
    case shared
    case weakShared
    case separate
}

struct KOIEntry<FabricType> {
    let scope: KOIObjectLifeScopes
    let fabric: FabricType
 
    init(scope: KOIObjectLifeScopes, fabric: FabricType) {
        self.scope = scope
        self.fabric = fabric
    }
}
