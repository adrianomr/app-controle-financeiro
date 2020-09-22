import 'package:date_format/date_format.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat, Intl;

class DataUtil {
  static DataUtil _singleton = DataUtil._instance();

  DataUtil._instance() {
    initializeDateFormatting();
    Intl.defaultLocale = 'pt_BR';
  }

  factory DataUtil() {
    return _singleton;
  }

  String getDataDiaMesAno(DateTime data) {
    return formatDate(data, [dd, '/', mm, '/', yyyy]);
  }

  String getHoraMinuto(DateTime data) {
    DateTime dataLocal = data.toLocal();
    return formatDate(dataLocal, [HH, ':', nn]);
  }

  String getMinutoSegundos(DateTime data) {
    DateTime dataLocal = data.toLocal();
    return formatDate(dataLocal, [nn, ':', ss]);
  }

  String getMesFormatado(DateTime data) {
    String mes = DateFormat.MMMM().format(data);
    return mes[0].toUpperCase() + mes.substring(1);
  }

  String getDiaExtenso(DateTime data) {
    switch (formatDate(data, [D])) {
      case "Sun":
        return "Dom";
      case "Mon":
        return "Seg";
      case "Tue":
        return "Ter";
      case "Wed":
        return "Qua";
      case "Thu":
        return "Qui";
      case "Fri":
        return "Sex";
      case "Sat":
        return "Sab";
    }
  }

  String getDataMesAno(data) {
    return formatDate(data, [yyyy, '/', mm]);
  }

  String getDataMesAnoExtensoFromString(String dataString) {
    List dataList = dataString.split("/");
    DateTime data = DateTime(int.parse(dataList[0]), int.parse(dataList[1]));
    String retorno = DateFormat.yMMMM().format(data);
    return retorno[0].toUpperCase() + retorno.substring(1);
  }

  String getDiaFormatado(data) {
    return formatDate(data, [dd]);
  }

  String getDataMesAnoDiaSemanaExtensoFromDate(DateTime dateTime) {
    return DateFormat.yMMMMEEEEd().format(dateTime)[0].toUpperCase() +
        DateFormat.yMMMMEEEEd().format(dateTime).substring(1);
  }
}
