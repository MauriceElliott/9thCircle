//
//  Player.swift
//  9thCircle
//
//  Created by Maurice Elliott on 24/05/2025.
//

import PlaydateKit

class Player: Scene {
    var velocity: (dx: Float, dy: Float)

    //Vars
    var isOnGround: Bool = true

    // Constants
    let gravity: Float = 1500
    let jumpStrength: Float = -450
    let moveSpeed: Float = 200

    //Will be removed map tiles are finished.
    let groundLevelY: Float = 100

    override init() {
        velocity = (dx: 0, dy: 0)
        super.init()
        position.x = 120
        position.y = groundLevelY
        do {
            image = try Graphics.Bitmap(path: "test.png")
        } catch {
            System.log("Failed to load player image: \(error)")
        }
        isOnGround = (position.y >= groundLevelY)
    }

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()

        if !isOnGround {
            velocity.dy += gravity * dt
        }

        //Reset horizontal momentum
        velocity.dx = 0

        if !System.buttonState.current.intersection([.left]).isEmpty {
            velocity.dx = -moveSpeed
        }
        if !System.buttonState.current.intersection([.right]).isEmpty {
            velocity.dx = moveSpeed
        }

        if !System.buttonState.pushed.intersection([.a]).isEmpty && isOnGround {
            velocity.dy = jumpStrength
            isOnGround = false
        }

        //Apply the movement
        moveBy(dx: (velocity.dx * dt), dy: (velocity.dy * dt))

        //Check colission and reset movement values.
        if position.y >= groundLevelY {
            moveTo(Point(x: position.x, y: groundLevelY))
            if velocity.dy > 0 {
                velocity.dy = 0
            }
            isOnGround = true
        } else {
            if position.y < groundLevelY {
                isOnGround = false
            }
        }
    }
}
