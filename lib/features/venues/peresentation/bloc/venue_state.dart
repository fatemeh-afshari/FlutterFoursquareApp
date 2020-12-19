import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/features/venues/data/models/detail_model.dart';
import 'package:sixth_soloution_test/features/venues/data/models/list_model.dart';


@immutable
abstract class VenueState extends Equatable {
  @override
  List<Object> get props => [];
}
class Empty extends VenueState {}

class ListLoading extends VenueState {}
class DetailLoading extends VenueState {}

class ListLoaded extends VenueState {
  final List<VenueListModel> list;

  ListLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}
class DetailLoaded extends VenueState {
  final VenueDetailModel detail;

  DetailLoaded({@required this.detail});

  @override
  List<Object> get props => [detail];
}

class Error extends VenueState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
