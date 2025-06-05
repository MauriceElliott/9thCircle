//
//  Platform.swift
//  ninethCircle
//
//  Created by Maurice Elliott on 03/06/2025.
//

import PlaydateKit

class LevelOneScene: Scene {
    override init() {
        super.init()
        do {
            image = try Graphics.Bitmap(path: "platform1.png")
        } catch {
            System.log("Failed to load player image: \(error)")
        }
        position.x = -200
        position.y = 0
    }

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
    }
}
