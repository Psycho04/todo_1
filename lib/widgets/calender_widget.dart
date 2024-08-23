import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/core/themes/light.dart';
import 'package:todo_1/providers/list_provider.dart';
import 'package:todo_1/screens/home/menu/calender_style.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return Stack(
      children: [
        EasyDateTimeLine(
          timeLineProps: EasyTimeLineProps(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          initialDate: listProvider.selectedCalenderDate,
          onDateChange: (selectedDate) {
            setState(() {
              listProvider.selectedCalenderDate = selectedDate;
              listProvider.getTodoListFromFirestore();
            });
          },
          activeColor: Theme.of(context).colorScheme.onPrimary,
          headerProps: const EasyHeaderProps(
            showHeader: false,
            dateFormatter: DateFormatter.monthOnly(),
          ),
          dayProps: EasyDayProps(
            todayStyle: DayStyle(
                dayStrStyle: Style.calenderStyle
                .copyWith(color: Theme.of(context).colorScheme.secondary),
                dayNumStyle: Style.calenderStyle
                .copyWith(color: Theme.of(context).colorScheme.secondary),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary)),
            height: 79.0,
            width: 58.0,
            dayStructure: DayStructure.dayStrDayNum,
            inactiveDayStyle: DayStyle(
              dayStrStyle: Style.calenderStyle
              .copyWith(color: Theme.of(context).colorScheme.secondary),
              dayNumStyle: Style.calenderStyle
              .copyWith(color: Theme.of(context).colorScheme.secondary),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
            ),
            activeDayStyle: DayStyle(
                dayStrStyle: Style.calenderStyle
                    .copyWith(color: MyLightTheme.primaryblue),
                dayNumStyle: Style.calenderStyle
                    .copyWith(color: MyLightTheme.primaryblue),
                borderRadius: 5),
          ),
        )
      ],
    );
  }
}