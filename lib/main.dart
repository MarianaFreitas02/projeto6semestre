import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rolê Acessível',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

// --- MainScreen (Tela Principal) ---
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2463), // Azul escuro
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/logo.png', height: 40), // Supondo que você tenha um logo
            const SizedBox(width: 10),
            const Text(
              'Rolê Acessível',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildMainButton(
                context,
                'Navegação por Texto',
                Icons.description,
                () {},
                const Color(0xFF0A2463),
              ), // Azul escuro
              const SizedBox(height: 20),
              _buildMainButton(
                context,
                'Navegação por Voz',
                Icons.record_voice_over,
                () {},
                const Color(0xFF0A2463),
              ), // Azul escuro
              const SizedBox(height: 50),
              _buildActionButton(context, 'LOGIN', () {
                Navigator.pushNamed(context, '/login');
              }, const Color(0xFFFFC107)), // Amarelo
              const SizedBox(height: 20),
              _buildActionButton(
                context,
                'SAIR',
                () {},
                const Color(0xFFFFC107),
              ), // Amarelo
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
    Color color,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 30),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
    Color color,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// --- LoginScreen (Tela de Login) ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2463), // Azul escuro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Icon(Icons.person, color: Colors.white, size: 30),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'E-mail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'seu.email@example.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const Text(
                'Senha',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: Colors.red, // Cor do checkbox quando marcado
                  ),
                  const Text('Lembrar de mim'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2463), // Azul escuro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'ENTRAR',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ), // Borda vermelha
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Entrar com google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Data Model for Place ---
class Place {
  final String name;
  final String category;
  final String subCategory;
  final String distance;
  final List<String> features;

  const Place({
    required this.name,
    required this.category,
    required this.subCategory,
    required this.distance,
    required this.features,
  });
}

// --- HomeScreen (Tela Principal do Aplicativo após Login) ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Todos';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Place> _allPlaces = const [
    Place(
      name: 'Padaria Princesa',
      category: 'Padaria',
      subCategory: 'Cafeteria',
      distance: '0.2 km',
      features: ['Rampa', 'Banheiro Adaptado', 'Cardápio Braile'],
    ),
    Place(
      name: 'Battagini Pizzas Lorena',
      category: 'Restaurante',
      subCategory: 'Pizzaria',
      distance: '0.5 km',
      features: ['Acesso facilitado', 'Vaga PCD', 'Atendimento por Libras'],
    ),
    Place(
      name: 'Café com Prosa',
      category: 'Cafés',
      subCategory: 'Cafeteria',
      distance: '1.1 km',
      features: ['Rampa', 'Mesas Adaptadas'],
    ),
    Place(
      name: 'Restaurante Sabor Caseiro',
      category: 'Restaurante',
      subCategory: 'Comida Brasileira',
      distance: '0.8 km',
      features: ['Acesso facilitado', 'Banheiro Adaptado'],
    ),
    Place(
      name: 'Doceria Doce Sonho',
      category: 'Padaria',
      subCategory: 'Doceria',
      distance: '0.3 km',
      features: ['Rampa', 'Cardápio Braile'],
    ),
    Place(
      name: 'Livraria Leitura Feliz',
      category: 'Lojas',
      subCategory: 'Livraria',
      distance: '1.5 km',
      features: ['Acesso facilitado', 'Atendimento por Libras'],
    ),
    Place(
      name: 'Farmácia Bem Estar',
      category: 'Lojas',
      subCategory: 'Farmácia',
      distance: '0.7 km',
      features: ['Rampa', 'Vaga PCD'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Place> get _filteredPlaces {
    List<Place> places = _allPlaces;

    // Filtro por categoria
    if (_selectedCategory != 'Todos') {
      places = places
          .where((place) => place.category == _selectedCategory)
          .toList();
    }

    // Filtro por pesquisa
    if (_searchQuery.isNotEmpty) {
      places = places
          .where(
            (place) =>
                place.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                place.subCategory.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2463), // Azul escuro
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xFF0A2463),
              ), // Ícone de pessoa no avatar
            ),
          ),
        ),
        title: const Text(
          'Seu nome',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.mic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  _buildCategoryChip('Todos'),
                  const SizedBox(width: 10),
                  _buildCategoryChip('Cafés'),
                  const SizedBox(width: 10),
                  _buildCategoryChip('Padaria'),
                  const SizedBox(width: 10),
                  _buildCategoryChip('Restaurante'),
                  const SizedBox(width: 10),
                  _buildCategoryChip('Lojas'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Lugares próximos',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ..._filteredPlaces
                .map(
                  (place) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15.0,
                    ), // Espaçamento entre os cards
                    child: _buildPlaceCard(
                      context,
                      place.name,
                      place.subCategory,
                      place.distance,
                      place.features,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFFC107), // Amarelo
        child: const Icon(
          Icons.location_on,
          color: Colors.red,
        ), // Ícone de localização vermelho
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    final bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.black : Colors.black),
        ),
        backgroundColor: isSelected
            ? const Color(0xFFFFC107)
            : Colors.grey[300]!,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.orange : Colors.transparent,
          ), // Borda para o selecionado
        ),
      ),
    );
  }

  Widget _buildPlaceCard(
    BuildContext context,
    String name,
    String category,
    String distance,
    List<String> features,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2463),
                    ), // Azul escuro
                    overflow: TextOverflow
                        .ellipsis, // Adiciona "..." se o texto for muito longo
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    distance,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              category,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: features
                  .map((feature) => _buildFeatureChip(feature))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String feature) {
    IconData iconData;
    Color bgColor;
    Color textColor = Colors.white;

    switch (feature) {
      case 'Rampa':
        iconData = Icons.accessible;
        bgColor = Colors.blue[700]!;
        break;
      case 'Banheiro Adaptado':
        iconData = Icons.wc;
        bgColor = Colors.blue[700]!;
        break;
      case 'Cardápio Braile':
        iconData = Icons.menu_book;
        bgColor = Colors.blue[700]!;
        break;
      case 'Acesso facilitado':
        iconData = Icons.wheelchair_pickup;
        bgColor = Colors.blue[700]!;
        break;
      case 'Vaga PCD':
        iconData = Icons.local_parking;
        bgColor = Colors.blue[700]!;
        break;
      case 'Atendimento por Libras':
        iconData = Icons.sign_language;
        bgColor = Colors.blue[700]!;
        break;
      case 'Mesas Adaptadas':
        iconData = Icons.table_bar;
        bgColor = Colors.blue[700]!;
        break;
      default:
        iconData = Icons.check_circle_outline;
        bgColor = Colors.grey[600]!;
    }

    return Chip(
      avatar: Icon(iconData, color: textColor, size: 18),
      label: Text(feature, style: TextStyle(color: textColor)),
      backgroundColor: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}

// --- ProfileScreen (Tela de Perfil) ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2463), // Azul escuro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Perfil do Usuário',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF0A2463),
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nome do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'email@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Lógica para editar perfil
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107), // Amarelo
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Editar Perfil',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Lógica para sair
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              child: const Text(
                'Sair da Conta',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
