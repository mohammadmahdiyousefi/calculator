import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  final String buymeacoffee =
      "https://www.buymeacoffee.com/mohammadmahdiyousefi";
  final String releases =
      "https://github.com/mohammadmahdiyousefi/calculator/releases";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "ُSettings",
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
              title: const Text("Version"),
              subtitle: const Text("Tap to check for update"),
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
            child: ListTile(
              title: const Text("share App"),
              subtitle: const Text("Let you friend share this App"),
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
              title: const Text("Liked my work ? "),
              subtitle: const Text("Buy me a coffee"),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: ListTile(
          //     title: const Text("Donate with Gpay"),
          //     subtitle: const Text("Every small amount makes me smile :) "),
          //     trailing: const Icon(
          //       Icons.payment,
          //       color: Colors.amber,
          //     ),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16)),
          //     onTap: () {},
          //   ),
          // ),
          const Spacer(),
          Padding(
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
        ],
      )),
    );
  }
}
