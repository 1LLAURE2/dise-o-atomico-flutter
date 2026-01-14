import 'package:flutter/material.dart';

class RegistrarBienPage extends StatefulWidget {
  const RegistrarBienPage({super.key});

  @override
  State<RegistrarBienPage> createState() => _RegistrarBienPageState();
}

class _RegistrarBienPageState extends State<RegistrarBienPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameCtrl = TextEditingController();
  final serialCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final responsableCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

  String? categoria;
  String? ubicacion;
  DateTime? fecha;
  String estadoBien = "Nuevo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Row(
          children: [
            Icon(Icons.add_circle, color: Color(0xff0A7E63)),
            SizedBox(width: 6),
            Text(
              "Registrar Bien",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.close, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(color: Color(0xff0A7E63)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.inventory_2, color: Colors.white, size: 32),
                    SizedBox(height: 6),
                    Text(
                      "Nuevo Bien Patrimonial",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Complete la información del bien",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // FOTO
              sectionTitle("Fotografía del Bien"),
              Container(
                height: 170,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                      SizedBox(height: 6),
                      Text("Toca para agregar foto"),
                      Text(
                        "JPG, PNG (Max. 5MB)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // INFORMACION BASICA
              sectionHeader("Información Básica"),
              editableCard(
                Column(
                  children: [
                    inputField("Nombre del Bien *", "Ej: Laptop Dell"),
                    dropdownField("Categoría *", categoria, [
                      "Laptop",
                      "Monitor",
                      "Silla",
                      "Impresora",
                    ], (v) => setState(() => categoria = v)),
                    inputArea(
                      "Descripción",
                      "Describe las características del bien...",
                    ),
                  ],
                ),
              ),

              // IDENTIFICACION
              sectionHeader("Identificación"),
              editableCard(
                Column(
                  children: [
                    inputField("Número de Serie", "Ej: SN123456789"),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.qr_code, color: Color(0xff0A7E63)),
                              SizedBox(width: 10),
                              Text("Código QR"),
                            ],
                          ),
                          Text(
                            "Vista Previa QR",
                            style: TextStyle(color: Color(0xff0A7E63)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // UBICACIÓN
              sectionHeader("Ubicación y Fecha"),
              editableCard(
                Column(
                  children: [
                    dropdownField("Ubicación *", ubicacion, [
                      "Almacén Central",
                      "Oficina 1",
                      "Laboratorio",
                    ], (v) => setState(() => ubicacion = v)),
                    datePickerField(),
                  ],
                ),
              ),

              // ESTADO
              sectionHeader("Estado del Bien"),
              editableCard(
                Column(
                  children: [
                    estadoOption("Nuevo", "Sin uso previo"),
                    estadoOption("Usado", "En buen estado"),
                    estadoOption("En Reparación", "Requiere mantenimiento"),
                  ],
                ),
              ),

              // EXTRA
              sectionHeader("Información Adicional"),
              editableCard(
                Column(
                  children: [
                    inputField("Valor de Adquisición", "\$ 0.00"),
                    inputField("Responsable Asignado", "Nombre"),
                    inputArea(
                      "Notas Adicionales",
                      "Información adicional relevante...",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // BOTONES
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0A7E63),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: enviar backend
                        }
                      },
                      child: const Text(
                        "Guardar Bien",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- COMPONENTES UI ----------

  Widget sectionTitle(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );

  Widget sectionHeader(String text) => Padding(
    padding: const EdgeInsets.all(16),
    child: Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  Widget editableCard(Widget child) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: child,
  );

  Widget inputField(String label, String hint) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 6),
      TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => label.contains("*") && (v == null || v.isEmpty)
            ? "Campo obligatorio"
            : null,
      ),
      const SizedBox(height: 12),
    ],
  );

  Widget inputArea(String label, String hint) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 6),
      TextFormField(
        maxLines: 3,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      const SizedBox(height: 12),
    ],
  );

  Widget dropdownField(
    String label,
    String? value,
    List<String> items,
    Function(String?) onCh,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        DropdownButtonFormField(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onCh,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          validator: (v) =>
              label.contains("*") && v == null ? "Campo obligatorio" : null,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget datePickerField() {
    return GestureDetector(
      onTap: () async {
        final f = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          initialDate: DateTime.now(),
        );
        setState(() => fecha = f);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fecha == null ? "Seleccionar fecha *" : fecha.toString()),
            const Icon(Icons.calendar_month),
          ],
        ),
      ),
    );
  }

  Widget estadoOption(String title, String subtitle) {
    final selected = estadoBien == title;

    return GestureDetector(
      onTap: () => setState(() => estadoBien = title),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? const Color(0xff0A7E63) : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? const Color(0xff0A7E63) : Colors.grey,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
