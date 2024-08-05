import 'package:calculator/bloc/theme/theme_bloc.dart';
import 'package:calculator/bloc/theme/theme_event.dart';
import 'package:calculator/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final String buymeacoffee =
      "https://www.buymeacoffee.com/mohammadmahdiyousefi";
  final String releases =
      "https://github.com/mohammadmahdiyousefi/calculator/releases";
  final _popupMenu = GlobalKey<PopupMenuButtonState>();
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localText = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          localText.setting,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        shadowColor: Theme.of(context).shadowColor,
        iconTheme: Theme.of(context).iconTheme,
        //  elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(localText.version),
              subtitle: Text(localText.taptoupdate),
              trailing: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Text(
                        'v${snapshot.data?.version ?? "0.0.0"}',
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onTap: () async {
                if (await canLaunchUrl(
                  Uri.parse(releases),
                )) {
                  await launchUrl(
                    Uri.parse(releases),
                  );
                } else {
                  await launchUrl(Uri.parse(releases),
                      mode: LaunchMode.externalApplication);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return ListTile(
                  title: Text(localText.language),
                  trailing: PopupMenuButton(
                      key: _popupMenu,
                      color: Theme.of(context).cardColor,
                      padding: EdgeInsets.zero,
                      initialValue: state.appLanguage,
                      icon: Text(
                        state.appLanguage,
                        style: Theme.of(context)
                            .listTileTheme
                            .leadingAndTrailingTextStyle,
                      ),
                      onSelected: (value) {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(SetLanguage(value));
                      },
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: "fa",
                              child: Text("فارسی"),
                            ),
                            const PopupMenuItem(
                              value: "en",
                              child: Text("English"),
                            ),
                          ]),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onTap: () {
                    _popupMenu.currentState?.showButtonMenu();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(localText.shareapp),
              subtitle: Text(localText.shareappsubtitle),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onTap: () async {
                await Share.share(
                    'https://cafebazaar.ir/app/com.example.calculator_pro_aseman');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(localText.likework),
              subtitle: Text(localText.buycoffee),
              trailing: Image.asset(
                "assets/images/buymeacoffee.png",
                height: 25,
                width: 25,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onTap: () async {
                await launchUrl(Uri.parse(buymeacoffee));
              },
            ),
          ),
          const Spacer(),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Made with    ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    "by Mohammad Mahdi    ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
