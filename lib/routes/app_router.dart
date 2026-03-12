// Copyright (C) 2026 Widget Suite
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:go_router/go_router.dart';
import 'package:oraffle/presentation/feature/winners/winners_screen.dart';
import 'package:oraffle/presentation/screens/home_screen.dart';
import 'package:oraffle/presentation/screens/raffle_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String raffle = '/raffle';
  static const String raffleWinners = '/winners';
}

final goRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.raffle,
      builder: (context, state) => const RaffleScreen(),
    ),
    GoRoute(
      path: AppRoutes.raffleWinners,
      builder: (context, state) => const WinnersScreen(),
    ),
  ],
);
