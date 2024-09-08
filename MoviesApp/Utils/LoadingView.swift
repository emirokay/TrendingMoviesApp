//
//  LoadingView.swift
//  MessageApp
//
//  Created by Emir Okay on 17.02.2024.
//

import SwiftUI

struct LoadingView: View {
    @Binding var show: Bool
    var body: some View {
		ZStack {
			if show {
				Group {
					Rectangle()
						.fill(.background)
						.ignoresSafeArea()
					VStack {
						ProgressView()
							.padding(15)
							.background(.tertiary, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
						Text("Loading..")
					}
				}
			}
		}
		.animation(.easeInOut(duration: 1), value: show)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(show: .constant(true))
    }
}
