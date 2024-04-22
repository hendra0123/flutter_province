part of 'widgets.dart';

class CardProvince extends StatefulWidget {
  final Province province;
  const CardProvince(this.province);

  @override
  State<CardProvince> createState() => _CardProvinceState();
}

class _CardProvinceState extends State<CardProvince> {
  @override
  Widget build(BuildContext context) {
    Province prov = widget.province;
    return Card(
      color: const Color(0xFFFFFFFFF),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        title: Text("${prov.province}"),
        subtitle: Text("province_id : ${prov.provinceId}"),
      ),
    );
  }
}
