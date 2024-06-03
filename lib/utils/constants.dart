class Constants {
  /// Token string to get token from local storage
  static String FCMToken = 'fcmToken';
  static String META_DATA = 'metadata';
  static String PlayersFemale = 'playersFemale';
  static String PlayersMale = 'playersMale';
  static String TEAMS = 'teams';
  static String TIMESTAMP = 'timestamp';
  static String TOKEN = 'sl_token';
  static String USERTYPE = 'userType';
  static String TicketCode = 'ticketCode';
  static String REFRESH_TOKEN = 'refreshToken';
  static String BASE_URL = 'https://app-api.sportlab.mn/';
  static String BASE_DEV_URL = 'https://app-api.dev.sportlab.mn/';
  static String BASE_UPLOAD_URL = 'https://upload.dev.sportlab.mn/';
  final DELETE_ACCOUNT_URL = 'https://docs.google.com/forms/d/e/1FAIpQLSdCA3sDIU4dncVA7t_KpGQ_KsP_8-gMsXaz8NjY_pS8tQHCWA/viewform?usp=sf_link';

  ///Хөгжүүлэлтийн орчны URL ашиглах эсэх
  ///
  /// Хэрвээ true бол бүх хүсэлт хөгжүүлэлтийн URL
  /// ашиглаж дуудагдана
  static bool isDevUrl = false;

  ///SplashScreen харуулах хугацаа
  static int splashDelayMillis = 2500;

  final String privacyPolicyHtml = """
    <h1>Нууцлалын бодлого: Sport Lab аппликейшн</h1>
    <h2>Ерөнхий мэдээ, мэдээлэл цуглуулах:</h2>
    <p>"Sport Lab аппликейшн" хэрэглэгчид нэвтрэх болон бүртгүүлэх шаардлагагүй. Аппликейшн зөвхөн хэрэглэгчийн байршлын мэдээллийг авна.</p>
    
    <h2>Байршлын мэдээлэл:</h2>
    <p>"Sport Lab аппликейшн"-г ашигласнаар та төхөөрөмж дээрх байршлын тохиргоог идэвхжүүлэхийг зөвшөөрнө. Бид зөвхөн аппликейшныг ашиглаж байх үед таны байршлын өгөгдөлд хандах бөгөөд энэ мэдээллийг таны газарзүйн байршилд тулгуурлан санал өгөх сонголтыг тохируулахад ашиглана.</p>
    
    <h2>Хэрэглэгчийн мэдээллийг бусдад түгээх:</h2>
    <p>"Sport Lab аппликейшн" нь хэрэглэгчийн мэдээллийг гуравдагч этгээдэд худалдах, арилжаалах, шилжүүлэхгүй. Байршлын өгөгдлийг зөвхөн аппликейшн дотор ашиглана.</p>
    
    <h2>Хэрэглэгчийн мэдээллийг хадгалах:</h2>
    <p>"Sport Lab аппликейшн" нь хэрэглэгчийн хувийн мэдээллийг үйлчилгээний хэрэгцээнээс гадуур аливаа ашиг олох зорилгоор ашиглахгүй болно. Байршлын мэдээллээ бусдад алдсанаас үүдэлтэй аливаа хор, хохирлыг "Duiz" хариуцахгүй болно.</p>
    
    <h2>Хэрэглэгч мэдээллээ удирдах:</h2>
    <p>Хэрэглэгч өөрийн төхөөрөмжийн байршлын тохиргоог хэдийд ч өөрчлөх боломжтой.</p>
    
    <h2>Нууцлалын бодлогын шинэчлэл:</h2>
    <p>"Sport Lab аппликейшн" нь нууцлалын бодлогод өөрчлөлт оруулах эрхтэй. Нууцлалын бодлогод өөрчлөлт оруулсан тохиолдолд тухай бүр "Duiz" мобайл аппликейшн болон сайт дээр нийтэд нээлттэй нийтлэх бөгөөд хэрэглэгч нь танилцах үүрэг хүлээнэ.</p>
    
    <p>©Sport Lab Application 2024</p>
  """;
}
