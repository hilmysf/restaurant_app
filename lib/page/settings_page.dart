import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/provider/preferences_provider.dart';
import 'package:restaurant_app/data/provider/scheduling_provider.dart';
import 'package:restaurant_app/widget/app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .apply(color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Consumer<PreferencesProvider>(
                builder: (context, provider, child) {
                  return ListView(
                    children: [
                      Material(
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Text('Restaurant Notification'),
                          subtitle: Text('Enable Notification'),
                          trailing: Consumer<SchedulingProvider>(
                            builder: (context, scheduled, _) {
                              return Switch.adaptive(
                                value: provider.isDailyReminderActive,
                                onChanged: (value) async {
                                  scheduled.scheduledReminder(value);
                                  provider.enableDailyReminder(value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
