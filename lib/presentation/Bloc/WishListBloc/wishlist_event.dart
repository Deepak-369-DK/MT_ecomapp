part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends WishlistEvent {}

class SortProducts extends WishlistEvent {
  final String sortBy;

  SortProducts(this.sortBy);

  @override
  List<Object?> get props => [sortBy];
}

class FilterProducts extends WishlistEvent {
  final String filterBy;

  FilterProducts(this.filterBy);

  @override
  List<Object?> get props => [filterBy];
}
