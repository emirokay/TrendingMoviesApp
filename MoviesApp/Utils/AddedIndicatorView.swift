//
//  AddedIndicatorView.swift
//  MoviesApp
//
//  Created by Emir Okay on 7.09.2024.
//

import SwiftUI

struct AddedIndicatorView: View {
	@Binding var show: Bool
    var body: some View {
		VStack {
			if show {
				RoundedRectangle(cornerRadius: 10, style: .continuous)
					.foregroundStyle(Color(.systemGray))
					.frame(maxWidth: UIScreen.main.bounds.width/8, maxHeight: UIScreen.main.bounds.height/17, alignment: .center)
					.overlay {
						Image(systemName: "checkmark")
							.resizable()
							.scaledToFit()
							.padding()
							.foregroundStyle(Color(.systemGray5))
					}
			}
			Spacer()
		}
		.animation(.easeInOut(duration: 0.25), value: show)
		.frame(maxHeight: UIScreen.main.bounds.height/1.70)
		
		
    }
}

#Preview {
	AddedIndicatorView(show: .constant(true))
}
