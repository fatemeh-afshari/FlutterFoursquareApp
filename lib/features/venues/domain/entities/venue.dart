import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Venue extends Equatable {
  final String id;
  final String name;

  Venue({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [id, name];
}