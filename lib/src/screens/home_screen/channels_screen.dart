import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wack/src/screens/home_screen/dummy_data/dummy_channels.dart';
import 'package:wack/src/screens/home_screen/messages_screen.dart';
import 'package:wack/src/screens/home_screen/models/channel.dart';
import 'package:wack/src/screens/home_screen/widgets/channel_display.dart';

class ChannelsScreen extends StatefulWidget {
  static const String screenId = 'home_screen';

  const ChannelsScreen({super.key});

  @override
  State<ChannelsScreen> createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  AdManagerInterstitialAd? _interstitialAd;

  final testAdUnitId = '/21775744923/example/interstitial';

  int selectedTabIndex = 0;

  void loadAndShowAd() {
    AdManagerInterstitialAd.load(
      adUnitId: testAdUnitId,
      request: const AdManagerAdRequest(),
      adLoadCallback: AdManagerInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('AdManagerInterstitialAd failed to load: $error');
        },
      ),
    );
    _interstitialAd?.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 120,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < dummyChannels.length; i++)
            ChannelDisplay(
              index: i,
              isSelected: i == selectedTabIndex,
              onTap: () => _onChangeTabPressed(context, i, dummyChannels[i]),
            ),
        ],
      ),
    );
  }

  Future<void> _onChangeTabPressed(
    BuildContext context,
    int channelIndex,
    Channel channel,
  ) async {
    if (channelIndex == selectedTabIndex) {
      return;
    }
    setState(() {
      selectedTabIndex = channelIndex;
    });
    loadAndShowAd();
    Navigator.pushNamed(
      context,
      MessagesScreen.screenId,
      arguments: {'channel_name': channel.name},
    );
  }
}
