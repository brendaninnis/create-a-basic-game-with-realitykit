//
//  GameView.swift
//  Balla Rolla
//
//  Created by Brendan Innis on 2023-02-11.
//

import SwiftUI
import RealityKit

struct GameView: View {
    @EnvironmentObject var gameSession: GameSession
    
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var gameSession: GameSession
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        gameSession.configureSession(forView: arView)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
