part of 'empty_cubit.dart';

class EmptyState extends WidgetState{
  const EmptyState();

  @override
  WidgetState fromJson(json) {
    return const EmptyState();
  }

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
