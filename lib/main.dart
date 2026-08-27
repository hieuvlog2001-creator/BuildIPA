import 'package:flutter/material.dart';

void main() {
  runApp(const RecreatedApp());
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1738D6)),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Default credentials requested by the user.
  static const String defaultUsername = 'Admin';
  static const String defaultPassword = 'admin';

  final usernameController =
      TextEditingController(text: defaultUsername);
  final passwordController =
      TextEditingController(text: defaultPassword);

  bool obscurePassword = true;
  bool rememberLogin = true;
  bool loading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (usernameController.text.trim() != defaultUsername ||
        passwordController.text != defaultPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tài khoản hoặc mật khẩu không đúng.')),
      );
      return;
    }

    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;
    setState(() => loading = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  InputDecoration _decoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, size: 21, color: const Color(0xFF7A7A7A)),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.white.withOpacity(.96),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Color(0xFF1D43D7), width: 1.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img/login_bg_main.webp',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.white.withOpacity(.04)),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight - 50),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Container(
                          width: 72,
                          height: 72,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 18,
                                offset: Offset(0, 7),
                                color: Color(0x22000000),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset('assets/img/MB_LOGO.png'),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF202020),
                          ),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          'Đăng nhập để tiếp tục',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.92),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 28,
                                offset: Offset(0, 12),
                                color: Color(0x18000000),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              TextField(
                                controller: usernameController,
                                textInputAction: TextInputAction.next,
                                decoration: _decoration(
                                  hint: 'Tài khoản',
                                  icon: Icons.person_outline_rounded,
                                ),
                              ),
                              const SizedBox(height: 13),
                              TextField(
                                controller: passwordController,
                                obscureText: obscurePassword,
                                onSubmitted: (_) => _login(),
                                decoration: _decoration(
                                  hint: 'Mật khẩu',
                                  icon: Icons.lock_outline_rounded,
                                  suffix: IconButton(
                                    onPressed: () => setState(
                                      () => obscurePassword = !obscurePassword,
                                    ),
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color(0xFF777777),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberLogin,
                                    activeColor: const Color(0xFF1738D6),
                                    onChanged: (v) => setState(
                                      () => rememberLogin = v ?? false,
                                    ),
                                  ),
                                  const Text(
                                    'Ghi nhớ đăng nhập',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF5E5E5E),
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Quên mật khẩu?'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: FilledButton(
                                  onPressed: loading ? null : _login,
                                  style: FilledButton.styleFrom(
                                    backgroundColor: const Color(0xFF1738D6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                  child: loading
                                      ? const SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.3,
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          'ĐĂNG NHẬP',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: .4,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 24),
                        Text(
                          'Tài khoản mặc định: Admin  •  Mật khẩu: admin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black.withOpacity(.50),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Trang chủ',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1738D6), Color(0xFF3455E6)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Xin chào, Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    )),
                SizedBox(height: 7),
                Text('Bạn đã đăng nhập thành công.',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _Tile(icon: Icons.account_balance_wallet_outlined, title: 'Số dư'),
          _Tile(icon: Icons.swap_horiz_rounded, title: 'Giao dịch'),
          _Tile(icon: Icons.qr_code_rounded, title: 'QR'),
          _Tile(icon: Icons.settings_outlined, title: 'Cài đặt'),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (_) => false,
            ),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _Tile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE8EDFF),
          child: Icon(icon, color: const Color(0xFF1738D6)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
