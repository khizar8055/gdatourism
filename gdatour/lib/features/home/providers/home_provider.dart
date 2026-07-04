import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/home_repository.dart';
import '../domain/repositories/home_repository_interface.dart';
import '../presentation/state/home_notifier.dart';
import '../presentation/state/home_state.dart';

final homeRepositoryProvider = Provider<HomeRepositoryInterface>((ref) {
  return HomeRepository();
});

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return HomeNotifier(repository);
});
