import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle
    let player = Player()

    init() {
        Graphics.clear(color: .black)
        Graphics.setBackgroundColor(.black)
        player.addToDisplayList()
    }

    // MARK: Internal
    func update() -> Bool {
        Graphics.clear(color: .black)
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}
