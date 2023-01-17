import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';
import 'package:mezorn_dummy/main.dart' as app;
import 'package:mezorn_dummy/utils/constants.dart';

import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login test', (tester) async {
    ///Login хийх гэж байгаа учир token цэвэрлэж байна
    MezornClientHelper().token = '';

    ///Апп ажиллуулж эхлэх
    await app.main();
    await tester.pumpAndSettle();

    // ///SplashScreen шилжих хугацааг хүлээж байна
    await tester.pump(Duration(milliseconds: Constants.splashDelayMillis + 1000));

    ///Утасны дугаар оруулах TextField-г олох
    var loginInput = find.byKey(Key('loginInput'));
    await TestUtils.pumpUntilFound(tester, loginInput);

    ///Утасны дугаар оруулах TextField олдсон эсэхийг шалгах
    expect(loginInput, findsOneWidget);

    ///Утасны дугаар оруулах үйлдэл
    await tester.enterText(loginInput, '99032206');

    ///Нэвтрэх товчлуур хайх үйлдэл
    var loginButton = find.byKey(Key('loginButton'));

    ///Нэвтрэх товчлуур байгаа эсэхийг шалгах
    expect(loginButton, findsOneWidget);

    ///Нэвтрэх товчлуурыг дарах үйлдэл
    await tester.tap(loginButton);

    // await tester.

    ///Баталгаажуулах дэлгэц хүлээх функц
    // await tester.pump(Duration(milliseconds: 5000));
    // await tester.pumpAndSettle(Duration(milliseconds: 5000));

    ///OTP оруулах TextField-г олох
    // var otpInput = find.byKey(Key('otpInput'));

    ///OTP оруулах TextField олдсон эсэхийг шалгах
    // expect(otpInput, findsOneWidget);

    ///OTP оруулах үйлдэл
    // await tester.enterText(otpInput, '0000');

    ///Баталгаажуулах точвлуур
    // var verifyButton = find.byKey(Key('verifyButton'));

    ///Баталгаажуулах товчлуур байгаа эсэхийг шалгах
    // expect(verifyButton, findsOneWidget);

    ///Баталгаажуулах товчлуур дарах үйлдэл
    // await tester.tap(verifyButton);
    // app.main();
    // await tester.pumpAndSettle();

    // await tester.pumpWidget(const LoginScreen());

    // // wait for data to load
    // await tester.pumpAndSettle();
    //
    // // find the item by text
    // final item = find.text('Alder');
    //
    // // assert item is found
    // expect(item, findsOneWidget);
    //
    // // Emulate a tap on the tile item.
    // await tester.tap(item);
    // await tester.pumpAndSettle();
    //
    // // Species name should be displayed
    // expect(find.text('Alnus'), findsOneWidget);
    //
    // // 'please select' text should not be displayed
    // expect(find.text('Please select a plant from the list.'), findsNothing);
  });
}
