# mezorn_dummy

Flutter прожект үүсгэхэд зориулсан жишээ прожект.



## Үндсэн тохиргоо

1. Source code git-с татаж аваад origin-оо өөрийн прожектын url-р солино
2. Android package name болон IOS Bundle ID солих. [mezorn_common](https://gitlab.com/mezorn/android/flutter_packages/mezorn_flutter_common_library) санд хэрхэн солих заавар нь байгаа
	Жишээ нь : **`flutter pub run mezorn_common:main mn.mezorn.hello`**. 

- 	Анхааруулга: package нэр солихдоо доогуур болон дундуур зураасаар сольж болохгүй
3. pubspec.yaml файл дотор байгаа mezorn_dummy нэрийг өөрийн прожектын нэрээр солино
4. Өөрийн editor дээрээ "mezorn_dummy/" гэж хайгаад бүгдийг нь өөрийн прожектын нэрээр солино. search and replace хийнэ гэсэн үг
5. [mezorn_fcm](https://gitlab.com/mezorn/android/flutter_fcm) сангын тохиргоонуудыг хийх ([firebase](https://firebase.google.com/) прожект үүсгэх, native тохиргоо хийх гэх мэт)
6. Тухайн прожектод зориулсан git-ийн тохиргоонуудаа хийж push хийх. (init, add remote, set branch... гэх мэт)
7. Дезайнерын гаргасан style guide-ийн дагуу прожектын `/style` хавтсан доторх загваруудыг өөрчилөх.
8. pubspec.yaml файл доторх mezorn сангуудад шинээр deploy token үүсгэж git url-г update хийнэ

## Боломжит үйлдлүүд

1. Device буюу төхөөрөмж дээр өгөгдөл хадгалах класс.

	**Өгөгдөл хадгалах**
```dart
LocalStorage.saveData();
```

**Өгөгдөл авах**


```dart
LocalStorage.getData();
```

## Mason ашиглах

```dart pub global activate mason_cli``` коммандаар mason идэвхжүүлнэ.
```mason get``` коммандаар mason.yaml файл доторх brick-үүдийг татна
```mason make las_vegas``` коммандаар las_vegas архитектурын дагуу файлууд үүсгэнэ

## Ашигласан mezorn сангууд

1. [mezorn_fcm](https://gitlab.com/mezorn/android/flutter_fcm) буюу мэдэгдэлтэй холбоотой сан. Энэ сангийн тохиргоонуудыг хийх
2. [mezorn_common](https://gitlab.com/mezorn/android/flutter_packages/mezorn_flutter_common_library) буюу бүх төрлийн апп-д зориулагдсан нийтлэг сан
3. [mezorn_api_caller](https://gitlab.com/mezorn/android/flutter-api-caller) буюу RestApi, GraphQL, WebSocket, MQTT ашиглан сервертэй ажиллах сан
4. 

## Ашигласан pub.dev сангууд

1. [get](https://pub.dev/packages/get)
2. [cached_network_image](https://pub.dev/packages/cached_network_image)
3. [permission_handler](https://pub.dev/packages/permission_handler)
4. [url_launcher](https://pub.dev/packages/url_launcher)
5. [flutter_lints](https://pub.dev/packages/flutter_lints)

## Дайвар сангууд буюу mezorn сангуудад ашиглаж буй сангууд

*Доорх сангууд нь бүгд export хийгдсэн учир прожект дотор чөлөөтэй импорт хийгээд ашиглаж болно*

**[mezorn_common](https://gitlab.com/mezorn/android/flutter_packages/mezorn_flutter_common_library) санд агуулагдсан**

1. [intl](https://pub.dev/packages/intl) 
2. [device_info_plus](https://pub.dev/packages/device_info_plus)
3. [package_info_plus](https://pub.dev/packages/package_info_plus)

**[mezorn_fcm](https://gitlab.com/mezorn/android/flutter_fcm) санд агуулагдсан**

1. [firebase_messaging](https://pub.dev/packages/firebase_messaging)
2. [firebase_core](https://pub.dev/packages/firebase_core)
3. [firebase_analytics](https://pub.dev/packages/firebase_analytics)

**[mezorn_api_caller](https://gitlab.com/mezorn/android/flutter-api-caller) санд агуулагдсан**

1. [connectivity_plus](https://pub.dev/packages/connectivity_plus)
2. [dio](https://pub.dev/packages/dio)
3. [crypto](https://pub.dev/packages/crypto)
4. [intl](https://pub.dev/packages/intl)
5. [graphql](https://pub.dev/packages/graphql)
6. [http](https://pub.dev/packages/http)