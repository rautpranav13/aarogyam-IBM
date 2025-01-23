import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'mr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? mrText = '',
  }) =>
      [enText, hiText, mrText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Profile
  {
    '25n10xtn': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'mr': 'प्रोफाइल',
    },
    'ninuox3x': {
      'en': 'Prescription',
      'hi': 'नुस्खा',
      'mr': 'प्रिस्क्रिप्शन',
    },
    'uz3eh7wg': {
      'en': 'Insights',
      'hi': 'इनसाइट्स',
      'mr': 'अंतर्दृष्टी',
    },
    '512bhyt6': {
      'en': 'Button',
      'hi': 'बटन',
      'mr': 'बटण',
    },
    'l9f043ki': {
      'en': 'Button',
      'hi': 'बटन',
      'mr': 'बटण',
    },
    'ziz4jypa': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'mr': 'प्रोफाइल',
    },
  },
  // ReportSanner
  {
    '7r6dgml9': {
      'en': 'Upload Image Here',
      'hi': 'छवि यहां अपलोड करें',
      'mr': 'येथे प्रतिमा अपलोड करा',
    },
    'afqcxs9q': {
      'en': 'What are you looking for?',
      'hi': 'तुम क्या ढूंढ रहे हो?',
      'mr': 'आपण काय शोधत आहात?',
    },
    'nbf28v7c': {
      'en': 'Prescription Analysis',
      'hi': 'प्रिस्क्रिप्शन विश्लेषण',
      'mr': 'प्रिस्क्रिप्शन विश्लेषण',
    },
    '7m9cszhf': {
      'en': 'Report Insights',
      'hi': 'रिपोर्ट अंतर्दृष्टि',
      'mr': 'अहवाल अंतर्दृष्टी',
    },
    'he2h6ahn': {
      'en': 'Set your own query',
      'hi': 'अपनी स्वयं की क्वेरी सेट करें',
      'mr': 'तुमची स्वतःची क्वेरी सेट करा',
    },
    'c6absh85': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // HomePage
  {
    'tjpyip45': {
      'en': 'आरोग्यम् धनसंपदा',
      'hi': 'आरोग्यम् धनसंपदा',
      'mr': 'आरोग्यम् धनसंपदा',
    },
    'h8wryjg9': {
      'en': 'Report Scanner',
      'hi': 'रिपोर्ट स्कैनर',
      'mr': 'अहवाल स्कॅनर',
    },
    'g420dy7s': {
      'en': 'Sanjeevani',
      'hi': 'संजीवनी',
      'mr': 'संजीवनी',
    },
    '9ekj0o6h': {
      'en': 'First Aid',
      'hi': 'प्राथमिक चिकित्सा',
      'mr': 'प्रथमोपचार',
    },
    '1p0lecux': {
      'en': 'Swipe the cards',
      'hi': 'कार्ड स्वाइप करें',
      'mr': 'कार्ड स्वाइप करा',
    },
    'ndtzjcwy': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // ResponsePage
  {
    'vjp6sgre': {
      'en': 'Insights',
      'hi': 'इनसाइट्स',
      'mr': 'अंतर्दृष्टी',
    },
    '5fpbbhqh': {
      'en': 'saveTXT',
      'hi': 'सेवTXT',
      'mr': 'सेव्ह टीएक्सटी',
    },
    '0h5e26mp': {
      'en': 'appendTXT',
      'hi': 'एपेंडTXT',
      'mr': 'TXT संलग्न करा',
    },
    'mcp4lunf': {
      'en': 'Remainder',
      'hi': 'शेष',
      'mr': 'बाकी',
    },
    'g6wo6fk7': {
      'en': 'awsmnotification',
      'hi': 'awsmनोटिफिकेशन',
      'mr': 'awsmnotification',
    },
    'xv2gaf0t': {
      'en': 'extractmedications',
      'hi': 'अर्कदवाएं',
      'mr': 'अर्क औषधे',
    },
    'hqk0ps0j': {
      'en': 'setawsmnotifi',
      'hi': 'setawsmnotifi (सेटएडब्ल्यूएसएमएनओटीआईएफआइ)',
      'mr': 'setawsmnotifi',
    },
    '4wlqv3ro': {
      'en': 'updatedbb',
      'hi': 'अपडेटेडबीबी',
      'mr': 'अद्यतनित bb',
    },
    'yngfy4d1': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // FirstAid
  {
    '22sm0hyg': {
      'en': 'First Aid',
      'hi': 'प्राथमिक चिकित्सा',
      'mr': 'प्रथमोपचार',
    },
    'p1at87to': {
      'en': 'First AId',
      'hi': 'प्रथम चिकित्सा',
      'mr': 'प्रथम एड',
    },
  },
  // auth_home
  {
    'p1qmu5mc': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
    'b2nqhvy9': {
      'en': 'You can delete this and create your home page here.',
      'hi': 'आप इसे हटा सकते हैं और यहां अपना होम पेज बना सकते हैं।',
      'mr': 'तुम्ही हे हटवू शकता आणि तुमचे मुख्यपृष्ठ येथे तयार करू शकता.',
    },
    'j6vbmjnv': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // auth_WelcomeScreen
  {
    'g7fdv4c8': {
      'en': 'Health Made Easy \nBecause You Deserve to Know!',
      'hi': 'स्वास्थ्य को आसान बनाएं\nक्योंकि आपको जानने का हक है!',
      'mr': 'आरोग्य सोपे केले \nकारण तुम्ही जाणून घेण्यास पात्र आहात!',
    },
    'lwdbwfhi': {
      'en': 'aarogyam',
      'hi': 'आरोग्यम',
      'mr': 'आरोग्यम',
    },
    'gbj6qm3r': {
      'en': 'Welcomes You!',
      'hi': 'आप का स्वागत है!',
      'mr': 'तुमचे स्वागत आहे!',
    },
    'a1vqxw0a': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'mr': 'लॉगिन करा',
    },
    'vgnnd9rk': {
      'en': 'Create an Account',
      'hi': 'खाता बनाएं',
      'mr': 'खाते तयार करा',
    },
    'yzdoyl6f': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // auth_Create
  {
    'si5dk0km': {
      'en': 'Welcome to Aarogyam!',
      'hi': 'आरोग्यम में आपका स्वागत है!',
      'mr': 'आरोग्यम मध्ये आपले स्वागत आहे!',
    },
    'whee82vi': {
      'en': 'Your health, your responsibilty.',
      'hi': 'आपका स्वास्थ्य, आपकी जिम्मेदारी.',
      'mr': 'तुमचे आरोग्य, तुमची जबाबदारी.',
    },
    'w9l1bx7r': {
      'en': 'Display Name',
      'hi': 'प्रदर्शित होने वाला नाम',
      'mr': 'डिस्प्ले नाव',
    },
    'npol9dz8': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'mr': 'ईमेल पत्ता',
    },
    'bcmqjsut': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    'b69qqu2r': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'mr': 'खाते तयार करा',
    },
    'iec1uda4': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // auth_Login
  {
    'egpcac1x': {
      'en': 'Get to my account',
      'hi': 'मेरे खाते पर जाएं',
      'mr': 'माझ्या खात्यावर जा',
    },
    '6z3qfnth': {
      'en': 'Access your health tools by logging in below.',
      'hi': 'नीचे लॉग इन करके अपने स्वास्थ्य उपकरणों तक पहुंचें।',
      'mr': 'खाली लॉग इन करून तुमच्या आरोग्य साधनांमध्ये प्रवेश करा.',
    },
    '75j59flg': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'mr': 'ईमेल पत्ता',
    },
    'im2ohehm': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    'v6maou3j': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
      'mr': 'पासवर्ड विसरलात?',
    },
    'fysqcdim': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'mr': 'लॉगिन करा',
    },
    '35y1ovsa': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // auth_ForgotPassword
  {
    'lldagzr1': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'mr': 'पासवर्ड विसरलात',
    },
    'rxlj86pt': {
      'en': 'We will send you a reset link.',
      'hi': 'हम आपको एक रीसेट लिंक भेजेंगे.',
      'mr': 'आम्ही तुम्हाला रीसेट लिंक पाठवू.',
    },
    'cwz07il0': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'mr': 'ईमेल पत्ता',
    },
    '44dk4ini': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'mr': 'लिंक पाठवा',
    },
    'rmp4yzjy': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // ReminderPage
  {
    'u9mun2ho': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // ProfilePageCopy
  {
    'ikcmg4a2': {
      'en': '[Display name]',
      'hi': '[प्रदर्शित होने वाला नाम]',
      'mr': '[नाव प्रदर्शित करा]',
    },
    'j1s401z6': {
      'en': '[Email id]',
      'hi': '[ईमेल आईडी]',
      'mr': '[ईमेल आयडी]',
    },
    'mov1e4vi': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // AllergiesPAgeCopy
  {
    'p3ero826': {
      'en': 'Allergies',
      'hi': 'एलर्जी',
      'mr': 'ऍलर्जी',
    },
    '8xkno1py': {
      'en': 'Let us know what triggers your allergies to help you stay safe.',
      'hi':
          'हमें बताएं कि आपकी एलर्जी किस कारण से होती है ताकि आप सुरक्षित रह सकें।',
      'mr':
          'तुम्हाला सुरक्षित राहण्यात मदत करण्यासाठी तुमच्या ॲलर्जी कशामुळे उत्पन्न होते ते आम्हाला कळवा.',
    },
    'dggjq2m4': {
      'en': 'Select Your Allergies',
      'hi': 'अपनी एलर्जी चुनें',
      'mr': 'तुमची ऍलर्जी निवडा',
    },
    'v38f2nih': {
      'en': 'Food Allergies',
      'hi': 'खाद्य प्रत्युर्जता',
      'mr': 'अन्न ऍलर्जी',
    },
    '32fnl9t7': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    'lckcwbrq': {
      'en': 'Peanuts',
      'hi': 'मूंगफली',
      'mr': 'शेंगदाणे',
    },
    'ndhgw9gx': {
      'en': 'Tree nuts (e.g., almonds, walnuts)',
      'hi': 'वृक्ष मेवे (जैसे, बादाम, अखरोट)',
      'mr': 'ट्री नट्स (उदा. बदाम, अक्रोड)',
    },
    'u8572t5m': {
      'en': 'Milk (lactose intolerance or dairy allergy)',
      'hi': 'दूध (लैक्टोज असहिष्णुता या डेयरी एलर्जी)',
      'mr': 'दूध (लैक्टोज असहिष्णुता किंवा दुग्धजन्य ऍलर्जी)',
    },
    'zitjaeqn': {
      'en': 'Eggs',
      'hi': 'अंडे',
      'mr': 'अंडी',
    },
    '9f3k3u8l': {
      'en': 'Shellfish (e.g., shrimp, crab, lobster)',
      'hi': 'शंख मछली (जैसे, झींगा, केकड़ा, झींगे)',
      'mr': 'शेलफिश (उदा. कोळंबी, खेकडा, लॉबस्टर)',
    },
    'ne3277lo': {
      'en': 'Fish (e.g., salmon, tuna)',
      'hi': 'मछली (जैसे, सैल्मन, टूना)',
      'mr': 'मासे (उदा. सॅल्मन, ट्यूना)',
    },
    'mbso4yei': {
      'en': 'Soy',
      'hi': 'सोया',
      'mr': 'सोया',
    },
    'ezjzc1tx': {
      'en': 'Wheat (gluten intolerance or allergy)',
      'hi': 'गेहूँ (ग्लूटेन असहिष्णुता या एलर्जी)',
      'mr': 'गहू (ग्लूटेन असहिष्णुता किंवा ऍलर्जी)',
    },
    'e6jku5u6': {
      'en': 'Environmeental Allergies',
      'hi': 'पर्यावरणीय एलर्जी',
      'mr': 'पर्यावरणीय ऍलर्जी',
    },
    '3wtjyht2': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    'pfja91d3': {
      'en': 'Pollen (grass, trees, or flowers)',
      'hi': 'पराग (घास, पेड़ या फूल)',
      'mr': 'परागकण (गवत, झाडे किंवा फुले)',
    },
    '155n6fyi': {
      'en': 'Dust mites',
      'hi': 'धूल के कण',
      'mr': 'धुळीचे कण',
    },
    'txv6vfqy': {
      'en': 'Mold spores',
      'hi': 'मोल्ड बीजाणु',
      'mr': 'मोल्ड स्पोर्स',
    },
    'piih6ugj': {
      'en': 'Animal dander (cats, dogs, etc.)',
      'hi': 'पशुओं की रूसी (बिल्लियाँ, कुत्ते, आदि)',
      'mr': 'प्राण्यांचा कोंडा (मांजर, कुत्री इ.)',
    },
    'ciqr4w5a': {
      'en': 'Cockroach droppings',
      'hi': 'कॉकरोच की बीट',
      'mr': 'झुरळाची विष्ठा',
    },
    'ykbi4k03': {
      'en': 'Latex',
      'hi': 'लाटेकस',
      'mr': 'लेटेक्स',
    },
    'o5ur31ps': {
      'en': 'Medication Allergies',
      'hi': 'दवा एलर्जी',
      'mr': 'औषधोपचार ऍलर्जी',
    },
    '19kwv7zf': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    '65dmvxxs': {
      'en': 'Penicillin or other antibiotics',
      'hi': 'पेनिसिलिन या अन्य एंटीबायोटिक्स',
      'mr': 'पेनिसिलीन किंवा इतर प्रतिजैविक',
    },
    '24jpkobg': {
      'en': 'Aspirin',
      'hi': 'एस्पिरिन',
      'mr': 'ऍस्पिरिन',
    },
    'vbwfek1v': {
      'en': 'Ibuprofen',
      'hi': 'आइबुप्रोफ़ेन',
      'mr': 'इबुप्रोफेन',
    },
    'teg6j9xe': {
      'en': 'Sulfa drugs',
      'hi': 'सल्फ़ा दवाएं',
      'mr': 'सल्फा औषधे',
    },
    'qm8juium': {
      'en': 'Anesthesia (e.g., lidocaine)',
      'hi': 'एनेस्थीसिया (जैसे, लिडोकेन)',
      'mr': 'ऍनेस्थेसिया (उदा. लिडोकेन)',
    },
    '8r8aq1p8': {
      'en': 'Insect Allergies',
      'hi': 'कीट एलर्जी',
      'mr': 'कीटक ऍलर्जी',
    },
    '0ti7rae8': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    'z0qtrvm8': {
      'en': 'Bee stings',
      'hi': 'मधुमक्खी के डंक',
      'mr': 'मधमाशी डंकतात',
    },
    'bthlz2pr': {
      'en': 'Wasp stings',
      'hi': 'ततैया का डंक',
      'mr': 'वास्प डंक',
    },
    'q727hoou': {
      'en': 'Mosquito bites',
      'hi': 'मच्छर का काटना',
      'mr': 'डास चावणे',
    },
    'uaa5av8o': {
      'en': 'Fire ant bites',
      'hi': 'अग्नि चींटियों के काटने',
      'mr': 'आग मुंगी चावते',
    },
    'tisj05ed': {
      'en': 'Chemical and Skin Allergies',
      'hi': 'रासायनिक और त्वचा एलर्जी',
      'mr': 'रासायनिक आणि त्वचा ऍलर्जी',
    },
    'ylxqtten': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    'py7e0jma': {
      'en': 'Perfumes or fragrances',
      'hi': 'इत्र या सुगंध',
      'mr': 'परफ्यूम किंवा सुगंध',
    },
    'ondmfbjp': {
      'en': 'Soaps or detergents',
      'hi': 'साबुन या डिटर्जेंट',
      'mr': 'साबण किंवा डिटर्जंट',
    },
    'sys8yrwz': {
      'en': 'Nickel (in jewelry or clothing)',
      'hi': 'निकेल (आभूषणों या कपड़ों में)',
      'mr': 'निकेल (दागिने किंवा कपड्यांमध्ये)',
    },
    'ydvubvhx': {
      'en': 'Hair dyes or cosmetics',
      'hi': 'बाल रंग या सौंदर्य प्रसाधन',
      'mr': 'केसांचे रंग किंवा सौंदर्यप्रसाधने',
    },
    'b7juo046': {
      'en': 'Cleaning products',
      'hi': 'उत्पादों की सफाई कर रहा हूं',
      'mr': 'स्वच्छता उत्पादने',
    },
    'vr30sbxb': {
      'en': 'Rare or Less Common Allergies',
      'hi': 'दुर्लभ या कम आम एलर्जी',
      'mr': 'दुर्मिळ किंवा कमी सामान्य ऍलर्जी',
    },
    'pz43we6w': {
      'en': '[Selected Alleriges]',
      'hi': '[चयनित एलर्जी]',
      'mr': '[निवडलेले ऍलर्जी]',
    },
    'gjvdd6mz': {
      'en': 'Sunlight (photosensitivity)',
      'hi': 'सूर्य का प्रकाश (प्रकाश संवेदनशीलता)',
      'mr': 'सूर्यप्रकाश (फोटोसंवेदनशीलता)',
    },
    'mbefpbxf': {
      'en': 'Cold temperatures (cold urticaria)',
      'hi': 'ठंडा तापमान (शीत पित्ती)',
      'mr': 'थंड तापमान (थंड अर्टिकेरिया)',
    },
    'b33uqgir': {
      'en': 'Water (aquagenic urticaria)',
      'hi': 'जल (एक्वाजेनिक अर्टिकेरिया)',
      'mr': 'पाणी (एक्वाजेनिक अर्टिकेरिया)',
    },
    'wl8lcb2e': {
      'en': 'Save',
      'hi': 'बचाना',
      'mr': 'जतन करा',
    },
    '3vqc5haw': {
      'en': 'Other...',
      'hi': 'अन्य...',
      'mr': 'इतर...',
    },
    'w7rl9kry': {
      'en': 'Specify  your allergy here...',
      'hi': 'अपनी एलर्जी यहां बताएं...',
      'mr': 'तुमची ऍलर्जी येथे निर्दिष्ट करा...',
    },
    'vkuk6frs': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // auth_userInfo
  {
    'u4fbkwh3': {
      'en': 'Help us personalize your experience.',
      'hi': 'अपने अनुभव को निजीकृत करने में हमारी सहायता करें।',
      'mr': 'आम्हाला तुमचा अनुभव वैयक्तिकृत करण्यात मदत करा.',
    },
    'krvzdyuc': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // Allergies
  {
    'v4cvorwt': {
      'en': 'Allergies',
      'hi': 'एलर्जी',
      'mr': 'ऍलर्जी',
    },
    'v4it3cs8': {
      'en': 'Food Allergies',
      'hi': 'खाद्य प्रत्युर्जता',
      'mr': 'अन्न ऍलर्जी',
    },
    'xitz7pac': {
      'en': 'Peanuts',
      'hi': 'मूंगफली',
      'mr': 'शेंगदाणे',
    },
    '37n9p1o8': {
      'en': 'Tree nuts (e.g., almonds, walnuts)',
      'hi': 'वृक्ष मेवे (जैसे, बादाम, अखरोट)',
      'mr': 'ट्री नट्स (उदा. बदाम, अक्रोड)',
    },
    '7izmft2n': {
      'en': 'Milk (lactose intolerance or dairy allergy)',
      'hi': 'दूध (लैक्टोज असहिष्णुता या डेयरी एलर्जी)',
      'mr': 'दूध (लैक्टोज असहिष्णुता किंवा दुग्धजन्य ऍलर्जी)',
    },
    'qwldzxs0': {
      'en': 'Eggs',
      'hi': 'अंडे',
      'mr': 'अंडी',
    },
    'hjr8gu65': {
      'en': 'Shellfish (e.g., shrimp, crab, lobster)',
      'hi': 'शंख मछली (जैसे, झींगा, केकड़ा, झींगे)',
      'mr': 'शेलफिश (उदा. कोळंबी, खेकडा, लॉबस्टर)',
    },
    'nxg05p9w': {
      'en': 'Fish (e.g., salmon, tuna)',
      'hi': 'मछली (जैसे, सैल्मन, टूना)',
      'mr': 'मासे (उदा. सॅल्मन, ट्यूना)',
    },
    '36jtdw0y': {
      'en': 'Soy',
      'hi': 'सोया',
      'mr': 'सोया',
    },
    'jqoiqi58': {
      'en': 'Wheat (gluten intolerance or allergy)',
      'hi': 'गेहूँ (ग्लूटेन असहिष्णुता या एलर्जी)',
      'mr': 'गहू (ग्लूटेन असहिष्णुता किंवा ऍलर्जी)',
    },
    'xcfte37b': {
      'en': 'Environmental Allergies',
      'hi': 'पर्यावरण संबंधी एलर्जी',
      'mr': 'पर्यावरणीय ऍलर्जी',
    },
    'uqs4gk20': {
      'en': 'Pollen (grass, trees, or flowers)',
      'hi': 'पराग (घास, पेड़ या फूल)',
      'mr': 'परागकण (गवत, झाडे किंवा फुले)',
    },
    'gu9iyur9': {
      'en': 'Dust mites',
      'hi': 'धूल के कण',
      'mr': 'धुळीचे कण',
    },
    '6keaylqw': {
      'en': 'Mold spores',
      'hi': 'मोल्ड बीजाणु',
      'mr': 'मोल्ड स्पोर्स',
    },
    'bjxvernh': {
      'en': 'Animal dander (cats, dogs, etc.)',
      'hi': 'पशुओं की रूसी (बिल्लियाँ, कुत्ते, आदि)',
      'mr': 'प्राण्यांचा कोंडा (मांजर, कुत्री इ.)',
    },
    '9bzu7qmj': {
      'en': 'Cockroach droppings',
      'hi': 'कॉकरोच की बीट',
      'mr': 'झुरळाची विष्ठा',
    },
    'vvabksjy': {
      'en': 'Latex',
      'hi': 'लाटेकस',
      'mr': 'लेटेक्स',
    },
    '64z8bhud': {
      'en': 'Medication Allergies',
      'hi': 'दवा एलर्जी',
      'mr': 'औषधोपचार ऍलर्जी',
    },
    'qdc6xo57': {
      'en': 'Penicillin or other antibiotics',
      'hi': 'पेनिसिलिन या अन्य एंटीबायोटिक्स',
      'mr': 'पेनिसिलीन किंवा इतर प्रतिजैविक',
    },
    'a0sjqk93': {
      'en': 'Aspirin',
      'hi': 'एस्पिरिन',
      'mr': 'ऍस्पिरिन',
    },
    '8q12e1nz': {
      'en': 'Ibuprofen',
      'hi': 'आइबुप्रोफ़ेन',
      'mr': 'इबुप्रोफेन',
    },
    'jj1guz3s': {
      'en': 'Sulfa drugs',
      'hi': 'सल्फ़ा दवाएं',
      'mr': 'सल्फा औषधे',
    },
    'eif9fchm': {
      'en': 'Anesthesia (e.g., lidocaine)',
      'hi': 'एनेस्थीसिया (जैसे, लिडोकेन)',
      'mr': 'ऍनेस्थेसिया (उदा. लिडोकेन)',
    },
    'hfdspp28': {
      'en': 'Insect Allergies',
      'hi': 'कीट एलर्जी',
      'mr': 'कीटक ऍलर्जी',
    },
    'usb32aa0': {
      'en': 'Bee stings',
      'hi': 'मधुमक्खी के डंक',
      'mr': 'मधमाशी डंकतात',
    },
    'ykntkkju': {
      'en': 'Wasp stings',
      'hi': 'ततैया का डंक',
      'mr': 'वास्प डंक',
    },
    'qrb48q63': {
      'en': 'Mosquito bites',
      'hi': 'मच्छर का काटना',
      'mr': 'डास चावणे',
    },
    '2vo7do12': {
      'en': 'Fire ant bites',
      'hi': 'अग्नि चींटियों के काटने',
      'mr': 'आग मुंगी चावते',
    },
    'rut7wupc': {
      'en': 'Chemical and Skin Allergies',
      'hi': 'रासायनिक और त्वचा एलर्जी',
      'mr': 'रासायनिक आणि त्वचा ऍलर्जी',
    },
    '8h8cqv82': {
      'en': 'Perfumes or fragrances',
      'hi': 'इत्र या सुगंध',
      'mr': 'परफ्यूम किंवा सुगंध',
    },
    '14h9zxpt': {
      'en': 'Soaps or detergents',
      'hi': 'साबुन या डिटर्जेंट',
      'mr': 'साबण किंवा डिटर्जंट',
    },
    'cm02jy6i': {
      'en': 'Nickel (in jewelry or clothing)',
      'hi': 'निकेल (आभूषणों या कपड़ों में)',
      'mr': 'निकेल (दागिने किंवा कपड्यांमध्ये)',
    },
    'awbn2z6g': {
      'en': 'Hair dyes or cosmetics',
      'hi': 'बाल रंग या सौंदर्य प्रसाधन',
      'mr': 'केसांचे रंग किंवा सौंदर्यप्रसाधने',
    },
    'bh2supoy': {
      'en': 'Cleaning products',
      'hi': 'उत्पादों की सफाई कर रहा हूं',
      'mr': 'स्वच्छता उत्पादने',
    },
    'luilux78': {
      'en': 'Rare or Less Common Allergies',
      'hi': 'दुर्लभ या कम आम एलर्जी',
      'mr': 'दुर्मिळ किंवा कमी सामान्य ऍलर्जी',
    },
    '9vzp42f0': {
      'en': 'Sunlight (photosensitivity)',
      'hi': 'सूर्य का प्रकाश (प्रकाश संवेदनशीलता)',
      'mr': 'सूर्यप्रकाश (फोटोसंवेदनशीलता)',
    },
    'iigpgbl4': {
      'en': 'Cold temperatures (cold urticaria)',
      'hi': 'ठंडा तापमान (शीत पित्ती)',
      'mr': 'थंड तापमान (थंड अर्टिकेरिया)',
    },
    'p629h6qb': {
      'en': 'Water (aquagenic urticaria)',
      'hi': 'जल (एक्वाजेनिक अर्टिकेरिया)',
      'mr': 'पाणी (एक्वाजेनिक अर्टिकेरिया)',
    },
    '7b9jl64z': {
      'en': 'Other...',
      'hi': 'अन्य...',
      'mr': 'इतर...',
    },
    'epom6kvc': {
      'en': 'Specify  your allergy here...',
      'hi': 'अपनी एलर्जी यहां बताएं...',
      'mr': 'तुमची ऍलर्जी येथे निर्दिष्ट करा...',
    },
    'mim19fdt': {
      'en': 'Save',
      'hi': 'बचाना',
      'mr': 'जतन करा',
    },
    '45ipmkls': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // ChatBot
  {
    'y00n3w78': {
      'en': 'संजीवनी',
      'hi': 'संजीवनी',
      'mr': 'संजीवनी',
    },
    '3z3jpqa9': {
      'en': 'Ask Sanjeevani...',
      'hi': 'संजीवनी से पूछें...',
      'mr': 'संजीवनीला विचारा...',
    },
    'se2monym': {
      'en': 'Sanjeevani',
      'hi': 'संजीवनी',
      'mr': 'संजीवनी',
    },
  },
  // CustomQuery
  {
    'aihm5ogt': {
      'en': 'Customize Your Response',
      'hi': 'अपना जवाब अनुकूलित करें',
      'mr': 'तुमचा प्रतिसाद सानुकूलित करा',
    },
    '4kf6ed6k': {
      'en':
          'Define the specific information you want to extract or analyze below.',
      'hi':
          'नीचे वह विशिष्ट जानकारी परिभाषित करें जिसे आप निकालना या विश्लेषण करना चाहते हैं।',
      'mr':
          'तुम्हाला खाली काढायची किंवा विश्लेषण करायची असलेली विशिष्ट माहिती परिभाषित करा.',
    },
    '88br9dza': {
      'en': 'Title',
      'hi': 'शीर्षक',
      'mr': 'शीर्षक',
    },
    'dfc0li1p': {
      'en': 'Write Title for your query',
      'hi': 'अपने प्रश्न के लिए शीर्षक लिखें',
      'mr': 'तुमच्या प्रश्नासाठी शीर्षक लिहा',
    },
    'svnuj1ua': {
      'en': 'Query',
      'hi': 'सवाल',
      'mr': 'क्वेरी',
    },
    'nb6jopb6': {
      'en': 'Write your query here',
      'hi': 'अपना प्रश्न यहां लिखें',
      'mr': 'तुमची क्वेरी इथे लिहा',
    },
    'exjw2j4a': {
      'en': 'or select from below',
      'hi': 'या नीचे से चुनें',
      'mr': 'किंवा खालीलपैकी निवडा',
    },
    '0j1qym1b': {
      'en': 'Suggest Generic Alternatives',
      'hi': 'सामान्य विकल्प सुझाएँ',
      'mr': 'जेनेरिक पर्याय सुचवा',
    },
    'jfpacsfi': {
      'en': 'Check Urguent Actions',
      'hi': 'ज़रूरी कार्रवाई की जाँच करें',
      'mr': 'त्वरित कृती तपासा',
    },
    'wc11du46': {
      'en': 'Suggest Lifestyle Activities',
      'hi': 'जीवनशैली गतिविधियाँ सुझाएँ',
      'mr': 'जीवनशैली उपक्रम सुचवा',
    },
    '5qdqj63s': {
      'en': 'Check for Painkillers',
      'hi': 'दर्द निवारक दवाओं की जांच करें',
      'mr': 'पेनकिलर तपासा',
    },
    'o8ioe8ak': {
      'en': 'Done',
      'hi': 'हो गया',
      'mr': 'झाले',
    },
    '4g93nxyp': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // dbpageee
  {
    'u0p6bc8a': {
      'en': 'Page Title',
      'hi': 'पृष्ठ शीर्षक',
      'mr': 'पृष्ठ शीर्षक',
    },
    'tsn146gw': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // ReminderListCollapsed
  {
    'ghu5h69e': {
      'en': 'Reminders',
      'hi': 'अनुस्मारक',
      'mr': 'स्मरणपत्रे',
    },
  },
  // ReminderListExpanded
  {
    'bicnjszb': {
      'en': 'Reminders',
      'hi': 'अनुस्मारक',
      'mr': 'स्मरणपत्रे',
    },
  },
  // UserInfo
  {
    'hgmz2lj6': {
      'en': 'Gender',
      'hi': 'लिंग',
      'mr': 'लिंग',
    },
    'isawvu9w': {
      'en': 'Gender',
      'hi': 'लिंग',
      'mr': 'लिंग',
    },
    'rujsu50h': {
      'en': 'Search...',
      'hi': 'खोज...',
      'mr': 'शोधा...',
    },
    'ivregv59': {
      'en': 'Male',
      'hi': 'पुरुष',
      'mr': 'पुरुष',
    },
    'a98knxxn': {
      'en': 'Female',
      'hi': 'महिला',
      'mr': 'स्त्री',
    },
    '3o64no9t': {
      'en': 'Other',
      'hi': 'अन्य',
      'mr': 'इतर',
    },
    'vv9lkdpc': {
      'en': 'Age',
      'hi': 'आयु',
      'mr': 'वय',
    },
    'qzxnu4hf': {
      'en': 'Height(cm)',
      'hi': 'ऊंचाई(सेमी)',
      'mr': 'उंची (सेमी)',
    },
    'x9th1dmu': {
      'en': 'Weight(kg)',
      'hi': 'वजन (किलोग्राम)',
      'mr': 'वजन (किलो)',
    },
    '5m34ql0z': {
      'en': 'Allergies(If any)',
      'hi': 'एलर्जी (यदि कोई हो)',
      'mr': 'ऍलर्जी (असल्यास)',
    },
  },
  // reminderEmpty
  {
    'zukstjy4': {
      'en': 'Set Reminder',
      'hi': 'अनुस्मारक सेट करें',
      'mr': 'स्मरणपत्र सेट करा',
    },
  },
  // setReminder
  {
    'hlok3i89': {
      'en': 'Set Reminder',
      'hi': 'अनुस्मारक सेट करें',
      'mr': 'स्मरणपत्र सेट करा',
    },
    '9e10du1m': {
      'en': 'Title',
      'hi': 'शीर्षक',
      'mr': 'शीर्षक',
    },
    'uaaimkwh': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'fx69e3ab': {
      'en': 'eg. Medicine or task',
      'hi': 'जैसे: दवा या कार्य',
      'mr': 'उदा. औषध किंवा कार्य',
    },
    'dptbbc68': {
      'en': 'Discription',
      'hi': 'विवरण',
      'mr': 'वर्णन',
    },
    '0td4xda8': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    's95pj3uk': {
      'en': 'eg. Dosage',
      'hi': 'उदाहरण: खुराक',
      'mr': 'उदा. डोस',
    },
    'vwymmhv4': {
      'en': 'Time',
      'hi': 'समय',
      'mr': 'वेळ',
    },
  },
  // AIDisclaimer
  {
    '1f518kcb': {
      'en': 'Medical Disclaimer',
      'hi': 'चिकित्सा अस्वीकरण',
      'mr': 'वैद्यकीय अस्वीकरण',
    },
    'fskqc96f': {
      'en':
          'The content generated by AI is for informational purposes only and should not be considered as medical advice. Always consult with qualified healthcare professionals for proper medical diagnosis, treatment, and advice regarding your specific situation.',
      'hi':
          'AI द्वारा तैयार की गई सामग्री केवल सूचनात्मक उद्देश्यों के लिए है और इसे चिकित्सा सलाह के रूप में नहीं माना जाना चाहिए। अपनी विशिष्ट स्थिति के बारे में उचित चिकित्सा निदान, उपचार और सलाह के लिए हमेशा योग्य स्वास्थ्य सेवा पेशेवरों से परामर्श करें।',
      'mr':
          'AI द्वारे व्युत्पन्न केलेली सामग्री केवळ माहितीच्या उद्देशाने आहे आणि ती वैद्यकीय सल्ला म्हणून मानली जाऊ नये. तुमच्या विशिष्ट परिस्थितीशी संबंधित योग्य वैद्यकीय निदान, उपचार आणि सल्ल्यासाठी नेहमीच योग्य आरोग्यसेवा व्यावसायिकांशी सल्लामसलत करा.',
    },
  },
  // Miscellaneous
  {
    'a3ixjb9v': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '6ttnlyti': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'q0icuhi6': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'awnbqjvs': {
      'en': 'For voice chat',
      'hi': 'वॉयस चैट के लिए',
      'mr': 'व्हॉइस चॅटसाठी',
    },
    'h0hg2wxl': {
      'en': 'notify',
      'hi': 'सूचित करें',
      'mr': 'सूचित करा',
    },
    '0egiun7a': {
      'en': 'Schedule Notifications',
      'hi': 'अधिसूचनाएँ शेड्यूल करें',
      'mr': 'सूचना शेड्यूल करा',
    },
    '3ihd6jbf': {
      'en': 'alarmmmm',
      'hi': 'अलार्ममम',
      'mr': 'अलार्म',
    },
    'a7n22548': {
      'en': 'qwertyuio',
      'hi': 'क्वर्टीयूआई',
      'mr': 'qwertyuio',
    },
    '7wmce0oj': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'u9suyyal': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'xzzq7fw3': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '3s8rbxvz': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '0j76yn5n': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'd6ntto8f': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'uvidvtsn': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'veowea7c': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'sykudc7k': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'dclk9yko': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'mxh2n7th': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '6503hqhg': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '5rpz9igl': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '2d5zu3mo': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'q15ccqka': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '46c2749m': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gnnwdcq2': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'g5yd1e3k': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'v83mf2pv': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'x9jg9umm': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '2lj2jbzd': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'z44nojn9': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'yxtk3kri': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'hbn73x4r': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'jtecy9uu': {
      'en': '',
      'hi': '',
      'mr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
