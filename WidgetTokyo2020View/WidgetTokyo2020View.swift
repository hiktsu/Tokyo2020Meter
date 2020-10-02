//
//  WidgetTokyo2020View.swift
//  WidgetTokyo2020View
//
//  Created by 露峰光 on 2020/10/02.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),tokyo2020meter: Tokyo2020MeterData(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),tokyo2020meter: Tokyo2020MeterData(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date:Date(),tokyo2020meter:Tokyo2020MeterData(), configuration: configuration)]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tokyo2020meter:Tokyo2020MeterData
    let configuration: ConfigurationIntent
}

struct WidgetTokyo2020ViewEntryView : View {
    var entry: Provider.Entry

    var body: some View {
       
            ExtractedView(entry:entry)
        
    }
}

@main
struct WidgetTokyo2020View: Widget {
    let kind: String = "WidgetTokyo2020View"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetTokyo2020ViewEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetTokyo2020View_Previews: PreviewProvider {
    static var previews: some View {
        WidgetTokyo2020ViewEntryView(entry: SimpleEntry(date: Date(),tokyo2020meter: Tokyo2020MeterData(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct ExtractedView: View {
    let entry:Provider.Entry
    var body:some View {
        ZStack{
            Color.blue
            VStack(alignment:.center) {
                Spacer()
                VStack(alignment:.leading){
                    Text("Today").padding(.leading,6)
                    Text(entry.date,style:.date).padding(.leading,6)
                }
                .background(ContainerRelativeShape().fill(Color.green))
                .foregroundColor(Color.black)
                
                Spacer()
                
                VStack(alignment:.leading)
                {
                    Text(entry.tokyo2020meter.remaining!,style: .relative).padding(.leading,6)
                    Text(entry.tokyo2020meter.remainingHours!,style: .timer).padding(.leading,6)
                    Text("to go").padding(.leading,6)
                    
                }
                .background(ContainerRelativeShape().fill(Color.green))
                .foregroundColor(Color.black)
                
                Spacer()
            }
        }
    }
}
