import 'package:app_login/design_system/pages/registrar_bien.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: const [
            Icon(Icons.dashboard, color: Color(0xff0A7E63)),
            SizedBox(width: 8),
            Text(
              'Dashboard',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER USUARIO
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xff0A7E63)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Bienvenido de nuevo",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Juan Pérez",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Gestiona tu inventario patrimonial",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ), // Foto demo
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ESTADISTICAS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Estadísticas del Inventario",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                StatCard(
                  color: Color(0xffDFF5EC),
                  icon: Icons.inventory,
                  value: "1,247",
                  label: "Total Bienes",
                ),
                StatCard(
                  color: Color(0xffE7F0FF),
                  icon: Icons.category,
                  value: "24",
                  label: "Categorías",
                ),
                StatCard(
                  color: Color(0xffE8FBEA),
                  icon: Icons.check_circle,
                  value: "1,189",
                  label: "Activos",
                ),
                StatCard(
                  color: Color(0xfffff0d1),
                  icon: Icons.location_on,
                  value: "18",
                  label: "Ubicaciones",
                ),
              ],
            ),

            // ACCESOS RÁPIDOS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Accesos Rápidos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            QuickButton(
              color: const Color(0xff0A7E63),
              title: "Registrar Nuevo Bien",
              subtitle: "Agregar al inventario",
              icon: Icons.add,
              onTap: () {
                print("REGISTRAR");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrarBienPage()),
                );
              },
            ),
            QuickButton(
              color: Colors.white,
              title: "Escanear Código QR",
              subtitle: "Buscar bien por QR",
              icon: Icons.qr_code_scanner,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrarBienPage()),
                );
              },
            ),
            QuickButton(
              color: Colors.white,
              title: "Ver Inventario",
              subtitle: "Lista completa de bienes",
              icon: Icons.view_list,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrarBienPage()),
                );
              },
            ),
            QuickButton(
              color: Colors.white,
              title: "Generar Reporte",
              subtitle: "Descargar estadísticas",
              icon: Icons.bar_chart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrarBienPage()),
                );
              },
            ),

            const SizedBox(height: 16),

            // ACTIVIDAD RECIENTE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Actividad Reciente",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Ver todo", style: TextStyle(color: Color(0xff0A7E63))),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const ActivityItem(
              color: Color(0xffE8FBEA),
              icon: Icons.add,
              title: "Nuevo bien registrado",
              description: "Laptop Dell Latitude 5420",
              time: "Hace 2 horas",
            ),
            const ActivityItem(
              color: Color(0xffE7F0FF),
              icon: Icons.qr_code_2,
              title: "QR escaneado",
              description: "Silla ergonómica",
              time: "Hace 5 horas",
            ),
            const ActivityItem(
              color: Color(0xffffecf4),
              icon: Icons.edit,
              title: "Bien actualizado",
              description: "Monitor Samsung 27”",
              time: "Ayer",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ---------- COMPONENTES ----------

class StatCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.color,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffD9E2EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class QuickButton extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const QuickButton({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color == Colors.white ? Colors.black : Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color == Colors.white
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: color == Colors.white
                          ? Colors.black54
                          : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: color == Colors.white ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String description;
  final String time;

  const ActivityItem({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffD9E2EC)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(description),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
