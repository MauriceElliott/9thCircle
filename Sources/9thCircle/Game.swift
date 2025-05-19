import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle
    let player = Player()

    init() {
        player.addToDisplayList()
    }

    // MARK: Internal
    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}
