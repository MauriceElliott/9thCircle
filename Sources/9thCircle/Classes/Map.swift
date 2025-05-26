//
//  Map.swift
//  9thCircle
//
//  Created by Maurice Elliott on 26/05/2025.
//

import PlaydateKit

class Map: Sprite.Sprite {
    override init() {
        super.init()
        do {
            image = try Graphics.Bitmap(path: "test.png")
        } catch {
            System.log("Failed to load player image: \(error)")
        }
    }

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
    }
}
