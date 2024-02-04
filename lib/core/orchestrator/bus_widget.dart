import 'package:flutter/material.dart';

import '../../injection_container.dart';
import 'bus.dart';
import 'events.dart';

abstract class StatelessBusWidget extends StatelessWidget {
  StatelessBusWidget({super.key, Bus? bus}) : _bus = bus ?? sl<Bus>();

  final Bus _bus;

  void fire<T extends BusEvent>(T event) => _bus.fire(event);
}

abstract class StatefulBusWidget extends StatefulWidget {
  StatefulBusWidget({super.key, Bus? bus}) : _bus = bus ?? sl<Bus>();

  final Bus _bus;

  void fire<T extends BusEvent>(T event) => _bus.fire(event);
}
