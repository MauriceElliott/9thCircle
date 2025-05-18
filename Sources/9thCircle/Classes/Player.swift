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
        bounds = .init(x: 120, y: 200, width: 20, height: 40)
        isOnGround = true
    }

    // MARK: Internal

    override func update() {
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
        
        if System.buttonState.current.contains(PDButtons.a) {
            isJumping = true
        }
        
        if position.y >= groundLevelY {
            isOnGround = false
        }
        
        
        let currentSpeed = isOnGround ? 0 : isJumping ? -1.000 : 1.000
        
        if System.buttonState.current.contains(PDButtons.left) {
            velocity.dx = Float(-currentSpeed)
        }
        if System.buttonState.current.contains(PDButtons.right) {
            velocity.dx = Float(currentSpeed)
        }
        
        if isJumping {
            velocity.dy = Float(currentSpeed)
        } else if !isOnGround {
            velocity.dy = Float(-currentSpeed)
        }
        
//        position.x += (velocity.dx * dt)
//        position.y += (velocity.dy * dt)
    }
}
