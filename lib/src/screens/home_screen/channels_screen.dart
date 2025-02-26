import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wack/src/screens/helpers/ad_helper.dart';
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
  RewardedAd? _rewardedAd;

  int? selectedTabIndex;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Channels',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  for (int i = 0; i < dummyChannels.length; i++)
                    ChannelDisplay(
                      index: i,
                      isSelected:
                          selectedTabIndex != null
                              ? i == selectedTabIndex
                              : false,
                      onTap:
                          () =>
                              _onChangeTabPressed(context, i, dummyChannels[i]),
                    ),
                ],
              ),
            ),
          ),
          isLoading
              ? Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withAlpha(150),
                  child: CircularProgressIndicator(),
                ),
              )
              : SizedBox(),
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
    // await AdManagerInterstitialAd.load(
    //   adUnitId: AdHelper.testInterstitialAdUnitId,
    //   request: const AdManagerAdRequest(),
    //   adLoadCallback: AdManagerInterstitialAdLoadCallback(
    //     onAdLoaded: (ad) async {
    //       debugPrint('$ad loaded.');
    //       _interstitialAd = ad;
    //       await _interstitialAd?.show();
    //
    //       setState(() {
    //         selectedTabIndex = channelIndex;
    //       });
    //       if (context.mounted) {
    //         Navigator.pushNamed(
    //           context,
    //           MessagesScreen.screenId,
    //           arguments: {'channel_name': channel.name},
    //         );
    //       }
    //     },
    //     onAdFailedToLoad: (LoadAdError error) {
    //       debugPrint('AdManagerInterstitialAd failed to load: $error');
    //     },
    //   ),
    // );

    setState(() {
      isLoading = true;
    });

    RewardedAd.load(
      adUnitId: AdHelper.testRewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) async {
          setState(() {
            isLoading = false;
          });

          debugPrint('$ad loaded.');
          _rewardedAd = ad;
          _rewardedAd?.show(
            onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {},
          );

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                selectedTabIndex = channelIndex;
              });
              if (context.mounted) {
                Navigator.pushNamed(
                  context,
                  MessagesScreen.screenId,
                  arguments: {'channel_name': channel.name},
                );
              }

              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }
}
