import PlaydateKit

class Player: Sprite.Sprite {
    var velocity: (dx: Float, dy: Float)
    
    //Vars
    var isOnGround: Bool = true
    var isJumping: Bool = false

    //Movement Statics - These define params for movement, would be awesome to make them adjustable at some point.
    let moveSpeed: Float = 100.0
    let jumpForce: Float = 450.0
    let gravity: Float = 100.0
    let maxFallSpeed: Float = 600.0
    let airControlFactor: Float = 0.8
    
    //Debug values
    let groundLevelY: Float = 200

    override init() {
        velocity = (dx: 0, dy: 0)
        super.init()
        position.y = groundLevelY
        image = try! Graphics.Bitmap(path: "test.png")
//        bounds = .init(x: 0, y: 0, width: 20, height: 40)
        if position.y >= groundLevelY {
            position.y = groundLevelY
            isOnGround = true
        }
    }

    // MARK: Internal

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
        
        let currentSpeed = isOnGround ? moveSpeed : moveSpeed * airControlFactor

        if System.buttonState.current.contains(PDButtons.left) {
            velocity.dx = -currentSpeed
        } else if System.buttonState.current.contains(PDButtons.right) {
            velocity.dx = currentSpeed
        } else {
            velocity.dx = 0
        }
        
        //Jump TODO: needs to moved out to game state rather than specifically checking the buttons here.
        if System.buttonState.current.contains(PDButtons.a) && isOnGround {
            isJumping = true
            velocity.dy = -jumpForce
        }
        
        //Apply Gravity
        if !isOnGround {
            velocity.dy += gravity * dt
            if velocity.dy > maxFallSpeed {
                velocity.dy = maxFallSpeed
            }
        }
        
        position.x += velocity.dx * dt //Was +=
        position.y += velocity.dy * dt //Was +=
        
        if position.y >= groundLevelY {
            if velocity.dy >= 0 {
                position.y = groundLevelY
                velocity.dy = 0
                isOnGround = true
                isJumping = false
            }
        }

        if position.y < groundLevelY && !isJumping {
            isOnGround = false
        }
        
        let xAsInt = Int(position.x)
        let yAsInt = Int(position.y)
        print("Position x (approx): \(xAsInt), y (approx): \(yAsInt)")
    }
}
