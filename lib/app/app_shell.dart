import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(context);

    return Scaffold(
      body: _SwipeTabBody(
        selectedIndex: selectedIndex,
        onSelected: (index) => context.go(_routes[index]),
        child: child,
      ),
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 104,
        child: _FloatingPillNav(
          selectedIndex: selectedIndex,
          onSelected: (index) => context.go(_routes[index]),
        ),
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/recording') ||
        location.startsWith('/evaluation')) {
      return 2;
    }

    final index = _routes.indexWhere(location.startsWith);
    return index < 0 ? 0 : index;
  }
}

const _routes = ['/home', '/mushaf', '/practice', '/insight', '/profile'];
const _horizontalSwipeMinDistance = 72.0;
const _horizontalSwipeMinVelocity = 360.0;

class _SwipeTabBody extends StatefulWidget {
  const _SwipeTabBody({
    required this.selectedIndex,
    required this.onSelected,
    required this.child,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final Widget child;

  @override
  State<_SwipeTabBody> createState() => _SwipeTabBodyState();
}

class _SwipeTabBodyState extends State<_SwipeTabBody> {
  double _dragDistance = 0;

  @override
  Widget build(BuildContext context) {
    if (!_canSwipeTabs(context)) {
      return widget.child;
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: (_) => _dragDistance = 0,
      onHorizontalDragUpdate: (details) {
        _dragDistance += details.delta.dx;
      },
      onHorizontalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;
        if (_dragDistance.abs() < _horizontalSwipeMinDistance &&
            velocity.abs() < _horizontalSwipeMinVelocity) {
          return;
        }

        final direction = _dragDistance < 0 || velocity < 0 ? 1 : -1;
        final nextIndex = (widget.selectedIndex + direction).clamp(
          0,
          _routes.length - 1,
        );

        if (nextIndex != widget.selectedIndex) {
          widget.onSelected(nextIndex);
        }
      },
      child: widget.child,
    );
  }

  bool _canSwipeTabs(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return _routes.contains(location);
  }
}

const _items = [
  _NavItem(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
  ),
  _NavItem(
    label: 'Mushaf',
    icon: Icons.menu_book_outlined,
    selectedIcon: Icons.menu_book_rounded,
  ),
  _NavItem(
    label: 'Practice',
    icon: Icons.mic_none_rounded,
    selectedIcon: Icons.mic_rounded,
    centerAction: true,
  ),
  _NavItem(
    label: 'Insight',
    icon: Icons.insights_outlined,
    selectedIcon: Icons.insights_rounded,
  ),
  _NavItem(
    label: 'Profile',
    icon: Icons.person_outline,
    selectedIcon: Icons.person_rounded,
  ),
];

class _FloatingPillNav extends StatelessWidget {
  const _FloatingPillNav({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        0,
        AppSpacing.sm,
        AppSpacing.xs,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.navy.withValues(alpha: 0.96),
              borderRadius: BorderRadius.circular(AppRadius.pill),
              border: Border.all(color: AppColors.cyan.withValues(alpha: 0.18)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.26),
                  blurRadius: 34,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xs,
                AppSpacing.xs,
                AppSpacing.xs,
                AppSpacing.xs,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var index = 0; index < _items.length; index++)
                    Expanded(
                      child: _AnimatedPillNavItem(
                        item: _items[index],
                        selected: selectedIndex == index,
                        onTap: () => onSelected(index),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedPillNavItem extends StatelessWidget {
  const _AnimatedPillNavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (item.centerAction) {
      return _CenterNavItem(item: item, selected: selected, onTap: onTap);
    }

    final theme = Theme.of(context);
    final color = selected ? AppColors.surfaceElevated : AppColors.muted;

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: Tooltip(
        message: item.label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: SizedBox(
            height: 58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  selected ? item.selectedIcon : item.icon,
                  size: 20,
                  color: color,
                ),
                const SizedBox(height: 3),
                Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: color,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
                    fontSize: 10.5,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CenterNavItem extends StatelessWidget {
  const _CenterNavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final duration = reduceMotion ? Duration.zero : AppMotion.normal;
    final theme = Theme.of(context);

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: Tooltip(
        message: item.label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: SizedBox(
            height: 76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  duration: duration,
                  curve: Curves.easeInOutCubic,
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF7C4DFF), AppColors.aqua],
                    ),
                    border: Border.all(
                      color: AppColors.surfaceElevated,
                      width: selected ? 4 : 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.aqua.withValues(alpha: 0.36),
                        blurRadius: selected ? 24 : 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    selected ? item.selectedIcon : item.icon,
                    color: AppColors.surfaceElevated,
                    size: 25,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: selected ? AppColors.aqua : AppColors.muted,
                    fontWeight: FontWeight.w800,
                    fontSize: 10.5,
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.centerAction = false,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool centerAction;
}
