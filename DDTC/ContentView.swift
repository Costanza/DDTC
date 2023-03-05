//
//  ContentView.swift
//  DDTC
//
//  Created by Chris Mayer on 5/3/2023.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @FocusState private var valueIsFocused: Bool
    @State private var desired = 25.0
    @State private var ambient = 25.0
    @State private var flour = 25.0
    @State private var levain = 25.0
    @State private var friction = 0.0
    @State private var recorded = 0.0

    private var measure = "C"

    private var waterTemp: Double {
        let result = desired * 4 - ambient - flour - levain - friction

        return result
    }


    private var measureStr: String {
        return "°\(measure)"
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Desired:")

                        TextField(
                            "Desired Dough Temperature",
                            value: $desired,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                        Spacer()
                        Text(measureStr)
                    }
                } header: {
                    Text("Desired Dough Temperature (\(measureStr))")
                }

                Section {
                    HStack {
                        Text("Ambient:")

                        TextField(
                            "Ambient",
                            value: $ambient,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)

                        Text(measureStr)
                    }

                    HStack {
                        Text("Flour:")

                        TextField(
                            "Flour",
                            value: $flour,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)

                        Text(measureStr)
                    }

                    HStack {
                        Text("Levain:")

                        TextField(
                            "Levain",
                            value: $levain,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)

                        Text(measureStr)
                    }

                    HStack {
                        Text("Friction:")

                        TextField(
                            "Friction",
                            value: $friction,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)

                        Text(measureStr)
                    }
                } header: {
                    Text("Measured Temperatures (°\(measure))")
                }

                Section {
                    HStack {
                        Text("Water Temperature:")
                        Text(waterTemp, format: .number)
                        Text(measureStr)
                    }
                } header: {
                    Text("Water Temperature to use (\(measureStr))")
                }

                Section {
                    HStack {
                        Text("Recorded:")

                        TextField(
                            "Recorded Temperature",
                            value: $recorded,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)

                        Text(measureStr)
                    }
                } header: {
                    Text("Recorded Dough Temperature (\(measureStr))")
                }
            }
            .navigationBarTitle("DDT Calculator")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
