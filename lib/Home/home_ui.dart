import 'package:flutter/material.dart';
import 'package:event_holding_app/Global/custom_color.dart';
import 'package:event_holding_app/Global/custom_text_style.dart';
import 'package:event_holding_app/Home/event_category.dart';

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
            margin: EdgeInsets.only(top: 4, bottom: 16),
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
                children: getEventCategoryCards(),
              ),
          ), // Event Category Card
          Container(
            //color: Colors.red,
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.05),
            child: ListView(
              
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                FlatButton.icon(
                  color: Colors.yellow,
                  icon: Icon(Icons.star), 
                  label: Text('Most popular'),
                  
                  onPressed: ()=>{},
                ),
                FlatButton.icon(
                  icon: Icon(Icons.star), 
                  label: Text('Most popular'),
                  
                  onPressed: ()=>{},
                ),
                                FlatButton.icon(
                  icon: Icon(Icons.star), 
                  label: Text('Most popular'),
                  
                  onPressed: ()=>{},
                )
              ],
            ),
          ), // Tab View
          Container(
            color: Colors.green,
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.1),
            child: ListView(
              scrollDirection: Axis.horizontal,
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

  List<Widget> getEventCategoryCards() {
    List<Widget> eventCategoryCards = [];
    List<EventCategory> eventCategories = getEventCategory();
    for (EventCategory eventCategory in eventCategories) {
      eventCategoryCards.add(eventCategoryCard(eventCategory));
    }
    return eventCategoryCards;
  }

  Widget eventCategoryCard(EventCategory eventCategory) {
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
                width: 120,
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

}