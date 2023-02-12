//
//  GameSession.swift
//  Balla Rolla
//
//  Created by Brendan Innis on 2023-02-11.
//

import Foundation
import Combine
import RealityKit
import ARKit

extension UIColor {
    static let steel = UIColor(red: 168/255, green: 176/255, blue: 178/255, alpha: 1)
}

final class GameSession: NSObject, ObservableObject {
    
    weak var arView: ARView?
    private var gameboard: Gameboard?
    
    func configureSession(forView arView: ARView) {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        arView.session.delegate = self
        self.arView = arView
    }
}

// MARK: - ARSessionDelegate

extension GameSession: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard gameboard == nil else {
            return
        }
        for anchor in anchors {
            guard anchor is ARPlaneAnchor else {
                continue
            }
            let gameboard = Gameboard(anchor)
            arView?.scene.anchors.append(gameboard)
            arView?.installGestures([.rotation, .translation], for: gameboard)
            self.gameboard = gameboard
            return
        }
    }
}
