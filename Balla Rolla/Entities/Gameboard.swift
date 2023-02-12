//
//  Gameboard.swift
//  Balla Rolla
//
//  Created by Brendan Innis on 2023-02-12.
//

import Foundation
import RealityKit
import ARKit

final class Gameboard: Entity, HasAnchoring, HasCollision, HasModel {
    required init() {
        fatalError("Must initialize a Gameboard with an anchor")
    }
    
    init(_ anchor: ARAnchor) {
        super.init()
        anchoring = AnchoringComponent(anchor)
        createBoardModel()
    }
    
    private func createBoardModel() {
        let boardMesh = MeshResource.generateBox(width: 0.5, height: 0.01, depth: 0.5)
        let boardMaterial = SimpleMaterial(color: .steel, isMetallic: true)
        model = ModelComponent(mesh: boardMesh, materials: [boardMaterial])
        collision = CollisionComponent(shapes: [ShapeResource.generateConvex(from: boardMesh)])
    }
}
