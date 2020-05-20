//
//  PhotoCache.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    
    
    private let queue = DispatchQueue(label: "Cache \(Cache.self)")
    func cache(value: Value, for key: Key) {
        
        // serial ->
        // concurrent -->
        queue.async {
            self.cache[key] = value
        }
        
        
        
        
        
        // sync --> line 25 will execute after the above closure
        // sync means we must wait for the closure to finish executing
        
        //async --> line 25 will execute () the above closure
        // will it run befort the closure? it depends how many blocks on the queue
        // will it run during the closure? it depends how many blocks on the queue
        // will it run after the closure? it depends how many blocks on the queue
        
    }
    
    func value(for key: Key) -> Value? {
        return queue.sync {cache[key]}
    }
    
    private var cache = [Key : Value]()
}
