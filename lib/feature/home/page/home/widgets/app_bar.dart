part of '../home_page.dart';

class _AppbarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(ProjectStrings.projectName),
      actions: const [_ThemeToggleButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ThemeToggleButton extends ConsumerWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => const _SettingsDialog(),
        );
      },
    );
  }
}

class _SettingsDialog extends ConsumerWidget {
  const _SettingsDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(AppProviderItems.themeProvider);
    final isTurkish = ref.watch(AppProviderItems.languageProvider);

    return AlertDialog(
      title: Text(
        ProjectStrings.settings,
        style: context.textTheme().bodyLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Theme Switch
          Padding(
            padding: context.paddingVerticalLow1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.dark_mode_outlined,
                      color: isDarkMode ? ProjectColors.white : ProjectColors.black,
                    ),
                    SizedBox(width: context.lowValue1),
                    Text(
                      ProjectStrings.themeDarkText,
                      style: context.textTheme().bodyLarge,
                    ),
                  ],
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(AppProviderItems.themeProvider.notifier).toggleTheme();
                  },
                  activeColor: ProjectColors.cobaltBlue,
                  activeTrackColor: ProjectColors.cobaltBlue.withOpacity(0.5),
                ),
              ],
            ),
          ),
          const Divider(),
          // Language Switch
          Padding(
            padding: context.paddingVerticalLow1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: isDarkMode ? ProjectColors.white : ProjectColors.black,
                    ),
                    SizedBox(width: context.lowValue1),
                    Text(
                      ProjectStrings.languageText,
                      style: context.textTheme().bodyLarge,
                    ),
                  ],
                ),
                Switch(
                  value: isTurkish,
                  onChanged: (value) {
                    ref.read(AppProviderItems.languageProvider.notifier).toggleLanguage(context);
                  },
                  activeColor: ProjectColors.cobaltBlue,
                  activeTrackColor: ProjectColors.cobaltBlue.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            ProjectStrings.okText,
            style: context.textTheme().bodyMedium?.copyWith(
                  color: ProjectColors.cobaltBlue,
                ),
          ),
        ),
      ],
    );
  }
}
