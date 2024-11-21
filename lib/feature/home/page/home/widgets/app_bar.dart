part of '../home_page.dart';

class _AppbarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(ProjectStrings.projectName),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
      actions: const [ThemeToggleButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
   

    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Ayarlar",
              style: context.textTheme().bodyLarge
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.dark_mode_outlined),
                          const SizedBox(width: 12),
                          Text(
                            'Karanlık Tema',
                            style: context.textTheme().bodyLarge,
                          ),
                        ],
                      ),
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          ref.read(themeProvider.notifier).toggleTheme();
                        },
                        activeColor: ProjectColors.cobaltBlue,
                        activeTrackColor: ProjectColors.cobaltBlue.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.music_note),
                          const SizedBox(width: 12),
                          Text(
                            'English',
                            style: context.textTheme().bodyLarge,
                          ),
                        ],
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
                  'Tamam',
                  style: TextStyle(color: ProjectColors.cobaltBlue),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}