import 'package:flutter/material.dart';
import 'theme/image_strings.dart';
import 'theme/responsive_sizes.dart';
import 'theme/theme_data/custom_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String _selectedLanguage = "English (US)";

  final List<String> _languages = [
    "English (US)",
    "Espanol",
    "Francais",
    "German",
    "Chinese",
    "Japanese",
    "Korean",
  ];

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                SizedBox(height: responsiveSize(context, 16)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: responsiveSize(context, 50),
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(50)
                      )
                  ),
                ),


                SizedBox(height: responsiveSize(context, 8),),
                Padding(
                  padding: EdgeInsets.all(responsiveSize(context, 16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select your preferred language',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: CustomColors.textColor),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 24),
                      ),
                    ],
                  ),
                ),

                // Divider
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveSize(context, 8),
                  ),
                  child: Divider(thickness: 2, color: Colors.grey[400]),
                ),

                // Scrollable list
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(responsiveSize(context, 16)),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: responsiveSize(context, 24),),
                      controller: scrollController,
                      itemCount: _languages.length,
                      itemBuilder: (context, index) {
                        final lang = _languages[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lang,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: CustomColors.textColor,
                              fontWeight: FontWeight.w500),
                            ),
                            Radio<String>(
                              value: lang,
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                setState(() => _selectedLanguage = value!);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageStrings.onboardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(responsiveSize(context, 24)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // select language button
                Align(
                  child: GestureDetector(
                    onTap: () {
                      _showLanguageSelector(context);
                    },
                    child: Container(
                      width: responsiveSize(context, 120),
                      height: responsiveSize(context, 32),
                      padding: EdgeInsets.all(responsiveSize(context, 4)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          responsiveSize(context, 20),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: responsiveSize(context, 2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _selectedLanguage,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(width: responsiveSize(context, 2)),
                          Icon(
                            Icons.expand_more,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          
                //intro text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: responsiveSize(context, 8),
                      ),
                      child: SizedBox(
                        width: responsiveSize(context, 265),
                        child: Text(
                          'Connect with your community wherever you are',
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(color: Colors.white),
                          softWrap: true,
                        ),
                      ),
                    ),
          
                    //auth bittons
                    SizedBox(height: responsiveSize(context, 16)),
                    _onboardingButtons(
                      context,
                      false,
                      CustomColors.button1,
                      ImageStrings.apple,
                      'Connect With AppleID',
                    ),
                    SizedBox(height: responsiveSize(context, 8)),
                    _onboardingButtons(
                      context,
                      false,
                      CustomColors.button2,
                      ImageStrings.google,
                      'Connect With Google',
                    ),
                    SizedBox(height: responsiveSize(context, 8)),
                    _onboardingButtons(
                      context,
                      true,
                      Colors.transparent,
                      ImageStrings.mail,
                      'Connect With E-mail',
                    ),
          
                    SizedBox(height: responsiveSize(context, 12)),
                    Padding(
                      padding: EdgeInsets.only(
                        top: responsiveSize(context, 8),
                        bottom: responsiveSize(context, 16),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: responsiveSize(context, 290),
                          child: Text(
                            'By signing up, you accept the Terms of Use and Privacy Policy of how we process your data.',
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _onboardingButtons(
    BuildContext context,
    bool showBorder,
    Color color,
    String icon,
    String title,
  ) {
    return Container(
      width: double.infinity,
      height: responsiveSize(context, 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsiveSize(context, 20)),
        border: showBorder ? Border.all(color: Colors.white) : null,
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: responsiveSize(context, 16),
            height: responsiveSize(context, 16),
          ),
          SizedBox(width: responsiveSize(context, 12)),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
