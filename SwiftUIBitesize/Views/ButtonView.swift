import SwiftUI

struct ButtonView: View {
    // MARK: - Properties
    var title: String
    var action: (() -> Void)
    
    // MARK: - Body
    var body: some View {
        Button(action: action, label: {
            Text(title.uppercased())
                .foregroundColor(Color.black)
                .font(.headline)
                .fontWeight(.bold)
                .frame(minWidth: 85)
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
                .background(Capsule().fill(Color.white))
        })
    }
}

// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Shuffle sports", action: { print("Did tap animate") })
    }
}
