//
//  ErrorView.swift
//  News App
//
//  Created by TI Digital on 21/07/21.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical,4)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Retry")
            })
            .padding(.vertical,12)
            .padding(.horizontal,30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15,weight: .heavy))
            .cornerRadius(10)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError)
            .previewLayout(.sizeThatFits)
    }
}
