import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/settings_bloc/settingsBloc.dart';
import 'package:flutter_weather/bloc/settings_bloc/settingsEvents.dart';
import 'package:flutter_weather/bloc/settings_bloc/settingsState.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
            return ListTile(
              title: Text(
                'Temperature Units',
              ),
              isThreeLine: true,
              subtitle: Text('Use metric measurements for temperature units.'),
              trailing: Switch(
                value: state.temperatureUnits == TemperatureUnits.celsius,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context)
                    .add(TemperatureUnitToggled()),
              ),
            );
          }),
        ],
      ),
    );
  }
}
