//
//  Home.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @State var showSearchSheet: Bool = false
    @State var showListEvents: Bool = true
    @State var showMapSettingsSheet: Bool = false
    @State var show2DMap: Bool = false
    @State var show3DMap: Bool = false
//    @State var show3DMap: Bool = false
//    @State var setCurrentLocation: Bool = false
    
    var body: some View {
        
        ZStack {
            mapView
                .bottomSheet(
                    presentationDetents: [.large, .medium, .height(200)],
                    isPresented: .constant(true),
                    cornerRadius: 30,
                    isTransparentBackground: true
                ) {

                    contentListWithTextField
                        .background(Color.black70)
                        .sheet(isPresented: $showSearchSheet) {
                            Text("Hi Search 🔍")
                        }
                        .bottomSheet(
                            presentationDetents: [.height(630)],
                            isPresented: $showMapSettingsSheet,
                            cornerRadius: 30,
                            isTransparentBackground: true
                        ) {
                            mapSettingsView
                                .background(Color.black70)
                        } onDismiss: {
                            showMapSettingsSheet = false
                        }
                        .sheet(isPresented: $show2DMap) {
                            Text("Hi 2D map 🗾")
                        }
                        .sheet(isPresented: $show3DMap) {
                            Text("Hi 3D map 🗺")
                        }

                } onDismiss: {

                }

        }
        
    }
    
    struct MapSetting: Hashable {
        static func == (lhs: Home.MapSetting, rhs: Home.MapSetting) -> Bool {
            lhs.title == rhs.title
        }
        
        let iconName: String
        let title: String
        let state: State
        let action: VoidCompletion
        
        enum State {
            case active
            case inactive
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(iconName)
            hasher.combine(title)
        }
    }
    
    private var mapSettingItems: [MapSetting] = [
        MapSetting(iconName: "iconMapSettingsFaceActive", title: "Эмоции", state: .active, action: { }),
        MapSetting(iconName: "iconMapSettingsWorkloadActive", title: "Загруженность", state: .inactive, action: { }),
        MapSetting(iconName: "iconMapSettingsTransportActive", title: "Транспорт", state: .active, action: { }),
        MapSetting(iconName: "iconMapSettingsAccessibilityActive", title: "Доступная среда", state: .active, action: { }),
        MapSetting(iconName: "iconMapSettingsEventsActive", title: "События", state: .active, action: { }),
        MapSetting(iconName: "iconMapSettingsLiveActive", title: "LIVE Эфиры", state: .inactive, action: { })
    ]
    
    private var mapSettingsView: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                HStack(spacing: 10) {
                    
                    ImageView(
                        name: "iconMapSettingsTitle",
                        size: .xxl,
                        renderingMode: .original
                    )
                    
                    Text("Настройки карты")
                        .font(.textLarge)
                        .foregroundColor(.grayBackground)
                    
                    Spacer()
                    
                    Button {
                        showMapSettingsSheet = false
                    } label: {
                        ImageView(name: "iconMapSettingCloseButton", size: .xxl, renderingMode: .original)
                    }
                    
                }
                .padding(.bottom, 40)
                
                VStack(spacing: 17) {
                    ForEach(mapSettingItems, id: \.self) { item in
                        CellButton(iconName: item.iconName, title: item.title, isActiveState: item.state == .active, action: item.action)
                    }
                }
                
                CellButton(iconName: "iconMapSettingsFavoritesActive", title: "Избранное", isActiveState: false, action: { })
                    .padding(.top, 55)
                    .padding(.bottom, 40)
                
                Spacer()
                
                FilledButton(title: "Сбросить все", isActiveState: false) {
                    print("Сбросить все")
                }
                .padding(.bottom, 20)
                
            }
            .padding(.all, 24)
            .background(Color.black70)
//            .ignoresSafeArea(.all)
            
        }
        .ignoresSafeArea()
        
    }
    
    private var mapView: some View {
//        let region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(
//                latitude: 55.830416,
//                longitude: 37.632059
//            ),
//            latitudinalMeters: 3000,
//            longitudinalMeters: 3000
//        )
//
//        let map = Map(coordinateRegion: .constant(region))
        let map = MapBoxMapView()
            .ignoresSafeArea()
            .overlay(alignment: .topLeading, content: {
                Button {
                    showSearchSheet.toggle()
                } label: {
                    Image("iconSearchButton")
                }
                .padding()
            })
            .overlay(alignment: .topTrailing, content: {
                Button {
                    showListEvents.toggle()
                } label: {
                    Image("iconFilterButton")
                }
                .padding()
            })
            .overlay(alignment: .bottomLeading, content: {
                Button {
                    showMapSettingsSheet.toggle()
                } label: {
                    Image("iconMapSettingsButton")
                }
                .padding(.leading)
                .padding(.bottom, 227)
            })
            .overlay(alignment: .bottomTrailing, content: {
                Button {
//                    showMapSettingsSheet.toggle()
//                    map. currentlocation.show
                    
                } label: {
                    Image("iconCurrentLocationButton")
                }
                .padding(.leading)
                .padding(.bottom, 227)
            })
            .overlay(alignment: .bottomTrailing, content: {
                
                VStack(spacing: 0) {
                    Button {
                        showMapSettingsSheet.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("icon2DActiveButton") // FIXME: add action
                        }
                    }
                    
                    Button {
                        showMapSettingsSheet.toggle()
                    } label: {
                        VStack(spacing: 0) {
                            Image("icon3DInactiveButton") // FIXME: add action
                        }
                    }
                    
                }
                .padding(.leading)
                .padding(.bottom, 227 + 58)
            })
        
        return map
    }
    
    private var contentListWithTextField: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Категории",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(eventTypeItems, id: \.self) { EventTypeView(item: $0) }
                }

                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Подборки по вашим интересам",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(yourIterestsItems, id: \.self) {  YourInterestsView(item: $0) }
                }

                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Вам понравится",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(youllLikedItItems, id: \.self) { YoullLikedItView(item: $0) }
                }

                Button {
                    print("Построй свой маршрут")
                } label: {
                    Image("imageYourRoute")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth - 48)
                }
                .padding(.vertical, 20)
                
                getEventTypesList(
                    stackType: .vertical,
                    headerTitle: "Экскурсии сегодня",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(todayExcursionItems, id: \.id) { TodayExcursionView(item: $0) }
                }
                
                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Полезное",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(usefulEventItems, id: \.id) { UsefulView(excursion: $0) }
                }
                
                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Чем заняться в выходные",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    WeekendEvents(items: weekendEventsItems)
                }

                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Программы экскурсий",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    ForEach(excursions, id: \.id) { ExcursionView(excursion: $0) }
                }

                getEventTypesList(
                    stackType: .horizontal,
                    headerTitle: "Популярные заведения",
                    headerButtonTitle: "Все >",
                    headerButtonAction: { }
                ) {
                    TopFoodPlacesView(items: topFoodPlacesItems)
                }
                
            }
            .padding(.top)
            .padding(.bottom, 40)
            .background(Color.black70)
            
        }
        .ignoresSafeArea()
        
    }
    
    @State var searchText: String = ""
    
    private var textField: some View {
        
        TextField("Что вы хотите посмостреть?", text: $searchText)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white100)
            }
        
    }
    
    var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    
    let eventTypeItems: [EventType] = [
        EventType(iconName: "iconEventTypeMusic", title: "Музыка", action: { }),
        EventType(iconName: "iconEventTypeFood", title: "Еда", action: { }),
        EventType(iconName: "iconEventTypeSport", title: "Спорт", action: { }),
        EventType(iconName: "iconEventTypeWalking", title: "Прогулки", action: { }),
        EventType(iconName: "iconEventTypeGames", title: "Игры", action: { }),
        EventType(iconName: "iconEventTypeMuseum", title: "Музеи", action: { }),
        EventType(iconName: "iconEventTypePavilions", title: "Павильоны", action: { }),
        EventType(iconName: "iconEventTypePonds", title: "Пруды", action: { }),
        EventType(iconName: "iconEventTypeRental", title: "Прокат", action: { }),
        EventType(iconName: "iconEventTypeEntertainment", title: "Развлечения", action: { }),
        EventType(iconName: "iconEventTypeGardens", title: "Сады", action: { }),
        EventType(iconName: "iconEventTypeFerrisWheel", title: "Колесо\nобозрения", action: { }),
    ]
    
    enum StackType {
        case horizontal
        case vertical
    }
    
    @ViewBuilder
    private func getEventTypesList<Content: View>(
        stackType: StackType = .vertical,
        headerTitle: String,
        headerButtonTitle: String,
        headerButtonAction: @escaping VoidCompletion,
        @ViewBuilder content: () -> Content
    ) -> some View {
        
        EvenCellWithHeader(headerTitle: headerTitle, rightButtonName: headerButtonTitle, rightButtonAction: headerButtonAction) {
            
            if stackType == .vertical {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8, content: content)
                }
                
            } else {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 0) {
                        
                        Rectangle()
                            .fill(Color.black70)
                            .frame(width: 24)
                        
                        HStack(spacing: 10, content: content)
                        
                        Rectangle()
                            .fill(Color.black70)
                            .frame(width: 24)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    private func getIndedFor(album: Excursion) -> Int {
        excursions.firstIndex(where: { $0.id == album.id }) ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
