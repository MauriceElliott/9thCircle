//
//  Scene.swift
//  ninthCircle
//
//  Created by Maurice Elliott on 03/06/2025.
//

import PlaydateKit

class Scene: Sprite.Sprite {
    func onLoad() {
        addToDisplayList()
    }

    func onUnload() {
        Sprite.removeAllSpritesFromDisplayList()
    }
}
