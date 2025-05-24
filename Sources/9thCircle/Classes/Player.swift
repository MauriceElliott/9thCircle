//
//  Player.swift
//  9thCircle
//
//  Created by Maurice Elliott on 24/05/2025.
//

import PlaydateKit

class Player: Sprite.Sprite {
    var velocity: (dx: Float, dy: Float)
    
    //Vars
    var isOnGround: Bool = true
    
    // Constants
    let gravity: Float = 1500
    let jumpStrength: Float = -600
    let moveSpeed: Float = 200

    //Will be removed map tiles are finished.
    let groundLevelY: Float = 200

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

    // MARK: Internal

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
        
        if !isOnGround {
            print("is not on ground, apply gravity.")
            velocity.dy += gravity * dt
        }
        
        //Reset horizontal momentum
        velocity.dx = 0

        if !System.buttonState.current.intersection([.left]).isEmpty {
            print("left")
            velocity.dx = -moveSpeed
        }
        if !System.buttonState.current.intersection([.right]).isEmpty {
            print("right")
            velocity.dx = moveSpeed
        }

        if !System.buttonState.pushed.intersection([.a]).isEmpty && isOnGround {
            print("is jumping")
            velocity.dy = jumpStrength
            isOnGround = false
        }
        
        
//        print("vel, x: \(Int(velocity.dx)), y: \(Int(velocity.dy))")
//        print("pos, x: \(Int(position.x)), y: \(Int(position.y))")
//        print(formatFloat(double: Double(velocity.dy)))
        
        moveBy(dx: (velocity.dx * dt), dy: (velocity.dy * dt))
        
        if position.y >= groundLevelY {
            print("position is greater than or equal to ground level!")
            moveTo(Point(x: position.x, y: groundLevelY))
            if velocity.dy > 0 {
                print("if velocity.dy > 0")
                velocity.dy = 0
            }
            isOnGround = true
        } else {
            print("else!")
            if position.y < groundLevelY {
                print("if pos.y < groundLevelY, is on ground is false.")
                 isOnGround = false
            }
        }
    }
}
