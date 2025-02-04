abstract class NavigationEvent {}

class ChangeTabEvent extends NavigationEvent {
  final int tabIndex;
  ChangeTabEvent(this.tabIndex);
}
