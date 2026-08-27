import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

const mbRed = Color(0xFFA9080B);
const mbDarkRed = Color(0xFF780005);
const mbPink = Color(0xFFE92D4F);
const mbCream = Color(0xFFFFF2C9);

void main() => runApp(const RecreatedApp());

class RecreatedApp extends StatelessWidget {
  const RecreatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MB',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: mbRed),
      ),
      home: const LoginPage(),
    );
  }
}

class MbMark extends StatelessWidget {
  final double size;
  final Color color;
  const MbMark({super.key, this.size = 42, this.color = const Color(0xFFE52B4F)});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _MbMarkPainter(color)),
      );
}

class _MbMarkPainter extends CustomPainter {
  final Color color;
  _MbMarkPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color..strokeCap = StrokeCap.round..strokeWidth = size.width * .17;
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width * .28;
    for (int i = 0; i < 7; i++) {
      final a = -1.57 + i * 0.8976;
      final start = Offset(c.dx + r * .65 * math.cos(a), c.dy + r * .65 * math.sin(a));
      final end = Offset(c.dx + r * 1.55 * math.cos(a), c.dy + r * 1.55 * math.sin(a));
      canvas.drawLine(start, end, p);
    }
  }

  @override
  bool shouldRepaint(covariant _MbMarkPainter oldDelegate) => oldDelegate.color != color;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const defaultUsername = 'Admin';
  static const defaultPassword = 'admin';
  final username = TextEditingController(text: defaultUsername);
  final password = TextEditingController(text: defaultPassword);
  bool hidePassword = true;
  bool loading = false;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (username.text.trim() != defaultUsername || password.text != defaultPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tài khoản hoặc mật khẩu không đúng.')));
      return;
    }
    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  }

  InputDecoration field(String hint, {Widget? suffix}) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF725F60), fontSize: 16),
        suffixIcon: suffix,
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0x99A38B8B))),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF8B2527), width: 1.5)),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/img/login_bg_main.webp', fit: BoxFit.cover),
          SafeArea(
            child: LayoutBuilder(builder: (context, c) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(44, 34, 44, 22),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: c.maxHeight - 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [const MbMark(size: 52), const SizedBox(width: 8), const Text('MB', style: TextStyle(fontSize: 47, fontWeight: FontWeight.w800, color: Color(0xFF1736C9)))]),
                      const SizedBox(height: 285),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(31),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(52, 48, 52, 0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF8EF).withOpacity(.78),
                              borderRadius: BorderRadius.circular(31),
                              border: Border.all(color: Colors.white.withOpacity(.85), width: 1.4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text('Chào mừng bạn\nđến với MB Bank', style: TextStyle(fontSize: 30, height: 1.25, color: Color(0xFF3B2525), fontWeight: FontWeight.w300)),
                                const SizedBox(height: 28),
                                TextField(controller: username, decoration: field('Tên đăng nhập', suffix: const Icon(Icons.info_outline, color: Color(0xFFDAA76B)))),
                                const SizedBox(height: 15),
                                TextField(controller: password, obscureText: hidePassword, onSubmitted: (_) => login(), decoration: field('Mật khẩu', suffix: IconButton(onPressed: () => setState(() => hidePassword = !hidePassword), icon: Icon(hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: const Color(0xFF9E7A61))))),
                                const SizedBox(height: 25),
                                Row(children: [Expanded(child: TextButton(onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft), child: const Text('Tạo tài khoản', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFFC74B09))))), Expanded(child: TextButton(onPressed: () {}, style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerRight), child: const Text('Quên mật khẩu?', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFFC74B09)))))]),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(31), bottomRight: Radius.circular(31)),
                                    child: Material(
                                      color: const Color(0xFFE84E22),
                                      child: InkWell(onTap: loading ? null : login, child: Center(child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 25),
                      const Center(child: Text('Phiên bản v28.5.61 (4)     Phiên bản mới nhất', style: TextStyle(fontSize: 14, color: Color(0xFF553F40)))),
                      const SizedBox(height: 18),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [circleIcon(Icons.facebook), const SizedBox(width: 22), circleIcon(Icons.language)]),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  static Widget circleIcon(IconData icon) => Container(width: 58, height: 58, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(.55), border: Border.all(color: Colors.white, width: 1.2)), child: Icon(icon, color: const Color(0xFF987E7A), size: 28));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hidden = true;
  int tab = 0;
  final PageController banner = PageController(viewportFraction: .73);

  @override
  void dispose() { banner.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFB00008), Color(0xFF7D0005)])))),
          Positioned(top: -90, right: -50, child: Container(width: 390, height: 390, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(.045)))),
          SafeArea(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(28, 14, 20, 0), child: Row(children: [const MbMark(size: 42, color: Colors.white), const SizedBox(width: 7), const Text('MB', style: TextStyle(color: Colors.white, fontSize: 39, fontWeight: FontWeight.w800)), const Spacer(), _topButton(Icons.support_agent), _topButton(Icons.refresh), _topButton(Icons.notifications_none), _topButton(Icons.menu, dot: true)])),
                const SizedBox(height: 25),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 28), child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [Container(width: 78, height: 78, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(.85), border: Border.all(color: Colors.white, width: 3)), child: const Icon(Icons.person, size: 52, color: Color(0xFF777777))), const SizedBox(width: 13), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7), decoration: BoxDecoration(color: const Color(0xFFD3A77D), borderRadius: BorderRadius.circular(20)), child: const Text('👑 NÂNG HẠNG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)))])),
                const SizedBox(height: 12),
                Container(margin: const EdgeInsets.symmetric(horizontal: 28), padding: const EdgeInsets.fromLTRB(25, 22, 20, 19), decoration: BoxDecoration(color: const Color(0xFFB21B1B).withOpacity(.73), borderRadius: BorderRadius.circular(28), border: Border.all(color: Colors.white.withOpacity(.28))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [const Text('Tổng số dư VND', style: TextStyle(color: Colors.white, fontSize: 17)), const SizedBox(width: 10), const Icon(Icons.chevron_right, color: Colors.white, size: 30), const Spacer(), GestureDetector(onTap: () => setState(() => hidden = !hidden), child: Icon(hidden ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: const Color(0xFFFFE26D), size: 28))]), const SizedBox(height: 10), Text(hidden ? '*** *** VND' : '7 VND', style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700)), const SizedBox(height: 8), Row(children: [const Text('SINH LỜI MỖI NGÀY', style: TextStyle(color: Color(0xFFFFD66B), fontSize: 15, fontWeight: FontWeight.w800)), const Spacer(), const Icon(Icons.chevron_right, color: Color(0xFFFFD66B), size: 28)])])),
                const SizedBox(height: 34),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(38), topRight: Radius.circular(38))),
                    child: Column(children: [
                      const SizedBox(height: 26),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_service(Icons.sync_alt_rounded, 'Chuyển\ntiền'), _service(Icons.phone_android_rounded, 'Nạp tiền\nđiện thoại'), _service(Icons.savings_outlined, 'Tiền gửi', tag: 'TÀI LỘC'), _service(Icons.volunteer_activism_outlined, 'Vay nhanh', tag: 'NHƯ GIÓ') ])),
                      const SizedBox(height: 18),
                      Container(width: 62, height: 62, decoration: const BoxDecoration(shape: BoxShape.circle, color: mbPink), child: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 38)),
                      const SizedBox(height: 19),
                      SizedBox(height: 145, child: PageView.builder(controller: banner, itemCount: 3, itemBuilder: (_, i) => _bannerCard(i))),
                      const SizedBox(height: 21),
                      const Align(alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.symmetric(horizontal: 54), child: Text('Mua sắm - Giải trí - Đầu tư', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF4A2222))))),
                      const SizedBox(height: 19),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 35), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_quick(Icons.casino_outlined, 'Vua Xổ Số'), _quick(Icons.confirmation_number_outlined, 'Vé số\nVietlott'), _quick(Icons.sim_card_outlined, 'Data 4G/\nNạp tiền'), _quick(Icons.flight_takeoff_rounded, 'Vé Máy Bay\nSố')])),
                      const Spacer(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(left: 34, right: 34, bottom: 16, child: _bottomBar()),
        ],
      ),
    );
  }

  static Widget _topButton(IconData icon, {bool dot = false}) => Container(margin: const EdgeInsets.only(left: 8), width: 45, height: 45, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(.13), border: Border.all(color: Colors.white.withOpacity(.2))), child: Stack(alignment: Alignment.center, children: [Icon(icon, color: Colors.white, size: 25), if (dot) Positioned(right: 7, top: 6, child: Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFC447))))]));

  static Widget _service(IconData icon, String label, {String? tag}) => SizedBox(width: 77, child: Column(children: [if (tag != null) Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), decoration: BoxDecoration(color: tag == 'TÀI LỘC' ? mbPink : const Color(0xFFE7F0FF), borderRadius: BorderRadius.circular(4)), child: Text(tag, style: TextStyle(color: tag == 'TÀI LỘC' ? Colors.white : const Color(0xFF3271C5), fontSize: 9, fontWeight: FontWeight.w800))), if (tag != null) const SizedBox(height: 4), Container(width: 78, height: 78, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(23), boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 18, offset: Offset(0, 5))]), child: Icon(icon, color: const Color(0xFF8B2023), size: 35)), const SizedBox(height: 9), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, height: 1.25, color: Color(0xFF1E2933), fontWeight: FontWeight.w600))]));

  static Widget _bannerCard(int i) { final titles = ['SIÊU THỊ SỐ\nLÊN LIVE', 'Tri ân khách hàng\n+1.5% lãi suất', 'Ưu đãi đặc biệt\ncho khách hàng']; final fills = [const Color(0xFF0755CC), const Color(0xFF071F85), const Color(0xFFE85C0B)]; return Container(margin: const EdgeInsets.symmetric(horizontal: 7), decoration: BoxDecoration(color: fills[i], borderRadius: BorderRadius.circular(24)), child: Stack(children: [Positioned.fill(child: CustomPaint(painter: _BannerPainter(i))), Padding(padding: const EdgeInsets.fromLTRB(25, 20, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('MB', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)), const Spacer(), Text(titles[i], style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w900, height: .95)), const SizedBox(height: 9), Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5), decoration: BoxDecoration(color: Colors.white.withOpacity(.18), borderRadius: BorderRadius.circular(15)), child: const Text('Xem ngay', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11)))]))])); }

  static Widget _quick(IconData icon, String text) => SizedBox(width: 76, child: Column(children: [Container(width: 64, height: 64, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: const [BoxShadow(color: Color(0x15000000), blurRadius: 14, offset: Offset(0, 4))]), child: Icon(icon, size: 31, color: const Color(0xFF8B2023))), const SizedBox(height: 9), Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, height: 1.15, color: Color(0xFF24313B)))]));

  Widget _bottomBar() => Container(height: 82, decoration: BoxDecoration(color: mbRed, borderRadius: BorderRadius.circular(25), boxShadow: const [BoxShadow(color: Color(0x40000000), blurRadius: 16, offset: Offset(0, 5))]), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_nav(Icons.home_rounded, 'Trang chủ', 0), _nav(Icons.credit_card_outlined, 'Thẻ', 1), Container(width: 63, height: 63, decoration: BoxDecoration(color: const Color(0xFFEAF2FF), borderRadius: BorderRadius.circular(20)), child: const Icon(Icons.qr_code_scanner_rounded, color: mbRed, size: 38)), _nav(Icons.card_giftcard_outlined, 'Ưu đãi', 3), _nav(Icons.apps_rounded, 'Thêm', 4)]));

  Widget _nav(IconData icon, String text, int index) => InkWell(onTap: () => setState(() => tab = index), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: index == tab ? const Color(0xFFFFF0A7) : Colors.white.withOpacity(.78), size: 29), const SizedBox(height: 3), Text(text, style: TextStyle(color: index == tab ? const Color(0xFFFFF0A7) : Colors.white.withOpacity(.8), fontSize: 11, fontWeight: FontWeight.w700))]));
}

class _BannerPainter extends CustomPainter {
  final int i;
  _BannerPainter(this.i);
  @override
  void paint(Canvas canvas, Size size) { final p = Paint()..color = Colors.white.withOpacity(.09); for (int n = 0; n < 8; n++) { canvas.drawCircle(Offset(size.width * (.08 + n * .15), size.height * (.3 + (n % 2) * .4)), 30 + n * 3, p); } }
  @override
  bool shouldRepaint(covariant _BannerPainter oldDelegate) => oldDelegate.i != i;
}

