//
//  ContentView.swift
//  Balla Rolla
//
//  Created by Brendan Innis on 2023-02-11.
//

import SwiftUI

struct ContentView : View {
    @StateObject var gameSession = GameSession()
    
    var body: some View {
        GameView()
            .environmentObject(gameSession)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
