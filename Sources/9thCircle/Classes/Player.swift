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
    var isJumping: Bool = false
    
    //Debug values
    let groundLevelY: Float = 200

    override init() {
        velocity = (dx: 0, dy: 0)
        super.init()
        position.x = 120
        position.y = 200
        image = try! Graphics.Bitmap(path: "test.png")
//        bounds = .init(x: 120, y: 200, width: 20, height: 40)
        isOnGround = true
    }

    // MARK: Internal

    override func update() {
        velocity = (dx: 0, dy: 0)
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
        
        print("start")
        
        if !System.buttonState.pushed.intersection([.a]).isEmpty {
            print("is jumping")
            isJumping = true
        } else {
            isJumping = false
        }
        
        if position.y == groundLevelY {
            isOnGround = true
        } else {
            isOnGround = false
        }
        
        let currentSpeed = isJumping ? -1000 : isOnGround ? 0 : 1000
        
        print("cs: \(Int(currentSpeed))")
        
        if !System.buttonState.current.intersection([.left]).isEmpty {
            print("left")
            velocity.dx = Float(-currentSpeed)
        }
        if !System.buttonState.current.intersection([.right]).isEmpty {
            print("right")
            velocity.dx = Float(currentSpeed)
        }
        
        if isJumping {
            print("is jumping!")
            velocity.dy = Float(currentSpeed)
        } else if !isOnGround {
            print("is on ground!")
            velocity.dy = Float(-currentSpeed)
        }
        
        print("vel, x: \(Int(velocity.dx)), y: \(Int(velocity.dy))")
        print("pos, x: \(Int(position.x)), y: \(Int(position.y))")
        print(formatFloat(double: Double(velocity.dy)))
        
        moveBy(dx: (velocity.dx * dt), dy: (velocity.dy * dt))
    }
}
