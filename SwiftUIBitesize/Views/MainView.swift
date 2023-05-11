import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = SportsViewModel()

    // MARK: - Body
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .center, spacing: 0) {
                    SportsView(viewModel: viewModel)
                    Spacer()
                    VStack(alignment: .center, spacing: 12) {
                        Text(viewModel.selectedSport?.title.uppercased() ?? unselectedSportDescription)
                            .foregroundColor(Color.gray)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .shadow(radius: 1)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 4)
                            .overlay(Rectangle()
                                .fill(Color.black)
                                .frame(height: 1), alignment: .bottom)
                            .animation(.default,
                                       value: viewModel.selectedSport?.title.uppercased() ?? unselectedSportDescription)
                        Text(selectSportDescription.uppercased())
                            .foregroundColor(Color.black)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .frame(minWidth: 85)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Capsule().fill(Color.white))
                    } //: VStack
                    .frame(minWidth: 280)
                } //: VStack
                .navigationTitle(navigationViewTitle)
                .navigationBarTitleDisplayMode(.inline)
            } //: NAVIGATION
        } //: ZStack
    }
}

// MARK: - Strings
extension MainView {
    var navigationViewTitle: String { "MAIN_VIEW_NAVIGATION_VIEW_TITLE".localized }
    var selectSportDescription: String { "MAIN_VIEW_SELECT_SPORT_DESCRIPTION".localized }
    var unselectedSportDescription: String { "MAIN_VIEW_NO_SPORT_SELECTED_DESCRIPTION".localized }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: SportsViewModel())
    }
}


/*var body: some View {
 ZStack {
     NavigationView {
         VStack(alignment: .center, spacing: 10) {
             SportsView(viewModel: viewModel)
             Spacer()
             Text(viewModel.selectedSport?.title.uppercased() ?? "-")
             Spacer()
         } //: VStack
         .navigationTitle(navigationViewTitle)
         .navigationBarTitleDisplayMode(.inline)
     } //: NAVIGATION
 } //: ZStack
}*/
