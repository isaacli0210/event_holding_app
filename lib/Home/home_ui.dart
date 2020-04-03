import 'package:flutter/material.dart';
import 'package:event_holding_app/Global/custom_color.dart';
import 'package:event_holding_app/Global/custom_text_style.dart';
import 'package:event_holding_app/Home/event_category.dart';
import 'package:event_holding_app/Home/event_filter.dart';
import 'package:event_holding_app/Home/event.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: ()=>{},
        ),
        title: Text('California', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: ()=>{},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
            margin: EdgeInsets.fromLTRB(16, 12, 16, 16),
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.10),
            decoration: BoxDecoration(
              color: cardGrey,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: Image.asset('assets/images/avatar.jpg'),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Amanda Jacobs', style: profileCardTitle),
                        SizedBox(width: 10),
                        InkWell(
                          child: Icon(Icons.edit, size: 18, color: titlePurple),
                          onTap: ()=>{},
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('UI/UX designer  -  ', style: profileCardSubTitle),
                        InkWell(
                          child: Text('37 friends', style: profileCardSubTitleUnderLine),
                          onTap: ()=>{},
                        )
                      ],
                    )   
                  ],
                )
              ],
            ),
          ), // Profile Card
          Container(
            // /color: Colors.grey,
            padding: EdgeInsets.only(left: 16),
            margin: EdgeInsets.only(bottom: 16),
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Hello', style: head1),
                      TextSpan(text: ', Amanda!', style: head2)
                    ]
                  ),
                ),
              ],
            )
          ), // Welcome Text
          Container(
            //color: Colors.green,
            padding: EdgeInsets.only(left: 16, right: 16),
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.25),
                child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16
                ),
                children: getEventCategoryCards(context),
              ),
          ), // Event Category Card
          Container(
            //color: Colors.red,
            padding: EdgeInsets.fromLTRB(16, 2, 0, 2),
            margin: EdgeInsets.only(bottom: 16),
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.05),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getEventFilterTab()
            ),
          ), // Tab View
          Container(
            //color: Colors.green,
            padding: EdgeInsets.fromLTRB(16, 10, 16, 2),
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.3),
            child: ListView(
              children: getEventCard(context)
            ),
          )
        ],
      ),
    );
  }

  List<EventCategory> getEventCategory() {
    List<String> eventNames = ['Professional events', 'Social events', 'Concerts & Theater', 'Events with friends'];
    List<IconData> eventIcons = [Icons.work, Icons.speaker, Icons.face, Icons.people];
    List<Color> eventColors = [cardRed, cardBlue, cardPurple, cardOrange];
    List<EventCategory> eventCategories = [];
    for(int i = 0; i < 4; i++) {
      eventCategories.add(EventCategory(eventNames[i], eventIcons[i], eventColors[i]));
    }
    return eventCategories;
  }

  List<Widget> getEventCategoryCards(BuildContext context) {
    List<Widget> eventCategoryCards = [];
    List<EventCategory> eventCategories = getEventCategory();
    for (EventCategory eventCategory in eventCategories) {
      eventCategoryCards.add(eventCategoryCard(eventCategory, context));
    }
    return eventCategoryCards;
  }

  Widget eventCategoryCard(EventCategory eventCategory, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: eventCategory.eventColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(eventCategory.eventCategoryName, style: eventCategoryTitle),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(eventCategory.eventCategoryIcon, color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }

  List<EventFilter> getEventFilter() {
    List<String> filterTitles = ['Popular', 'Latest', 'Friends', 'Large', 'Mini'];
    List<IconData> filterIcons = [Icons.star, Icons.fiber_new];
    List<EventFilter> eventFilters = [];
    for (int i = 0; i < 5; i++) {
      if (i < 2) 
        eventFilters.add(EventFilter(filterTitles[i], filterIcons[i]));
      else
        eventFilters.add(EventFilter.noIcon(filterTitles[i]));
    }
    return eventFilters;
  }

  List<Widget> getEventFilterTab() {
    List<Widget> eventFilterTabs = [];
    List<EventFilter> eventFilters = getEventFilter();
    for (EventFilter eventFilter in eventFilters) {
      eventFilterTabs.add(eventFilterTab(eventFilter));
    }
    return eventFilterTabs;
  }

  Widget eventFilterTab(EventFilter eventFilter) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 12, 2),
      padding: EdgeInsets.fromLTRB(2, 6, 2, 6),
      decoration: BoxDecoration(
        color: cardGrey,
         border: Border.all(width:0.5, color: titlePurple),
         borderRadius: BorderRadius.all(Radius.circular(8))
       ),
      child: InkWell(
        child: Row(
          children: <Widget>[ 
            Icon(eventFilter.filterIcon, size: 16, color: titlePurple),    
            Text(eventFilter.filterTitle, style: tabTitle)
          ],
        ),
        onTap: ()=>{},
      )
    );
  }

  List<Event> getEvent() {
    List<String> eventTitles = ['Scorpions', 'Design Highway', '.market meetup'];
    List<String> eventSubTitles = ['World Tour - ANGELS TOUR', 'Seminar for designers and design leads', 'Meetup fro marketing specialists'];
    List<String> eventDates = ['23.09.19 7PM', '12.12.19 6PM', '07.03.20 8PM'];
    List<String> eventLocations = ['PALACE stadium', 'FreeckySpace, CA', 'FreeckySpace, CA'];
    List<int> eventPrices = [90, 15, 0];
    List<Event> events = [];

    for(int i = 0; i < 3; i++) {
      events.add(Event(eventTitles[i], eventSubTitles[i], eventDates[i], eventLocations[i], eventPrices[i]));
    }
    return events;
  }
  
  List<Widget> getEventCard(BuildContext context) {
    List<Event> events = getEvent();
    List<Widget> eventCards = [];
    for(Event event in events) {
      eventCards.add(eventCard(event, context));
    }
    return eventCards;
  }

  Widget eventCard(Event event, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.28),
      decoration: BoxDecoration(
        color: cardPurple,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(event.eventTitle, style: eventCardTitle)
                ],
              ),
              Row(
                children: <Widget>[
                  Text(event.eventSubTitle, style: eventCardSubTitle)
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Date', style: eventCardKey),
                  Text(event.eventDate, style: eventCardValue)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Location\t\t', style: eventCardKey),
                  Text(event.eventLocation, style: eventCardValue),
                  Text('\$ ${event.eventPrice.toString()}', style: eventCardValue)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}