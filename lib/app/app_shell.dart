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
        height: 74,
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
      return 1;
    }
    final index = _routes.indexWhere(location.startsWith);
    return index < 0 ? 0 : index;
  }
}

const _routes = ['/home', '/practice', '/insight', '/profile'];

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
        final shouldMove =
            _dragDistance.abs() >= _horizontalSwipeMinDistance ||
            velocity.abs() >= _horizontalSwipeMinVelocity;

        if (!shouldMove) {
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
    label: 'Practice',
    icon: Icons.mic_none_outlined,
    selectedIcon: Icons.mic_rounded,
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
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(AppRadius.pill),
              border: Border.all(color: AppColors.line),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.14),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var index = 0; index < _items.length; index++)
                    _AnimatedPillNavItem(
                      item: _items[index],
                      selected: selectedIndex == index,
                      onTap: () => onSelected(index),
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
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final duration = reduceMotion
        ? Duration.zero
        : const Duration(milliseconds: 360);
    final theme = Theme.of(context);

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Tooltip(
          message: item.label,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.easeInOutCubic,
              width: selected ? 108 : 44,
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              decoration: BoxDecoration(
                color: selected ? AppColors.aqua : Colors.transparent,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    selected ? item.selectedIcon : item.icon,
                    size: 19,
                    color: selected ? AppColors.ink : AppColors.muted,
                  ),
                  if (selected) ...[
                    const SizedBox(width: AppSpacing.xxs),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: duration,
                        curve: Curves.easeInOutCubic,
                        opacity: selected ? 1 : 0,
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: AppColors.ink,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
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
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
