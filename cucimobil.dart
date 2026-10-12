
import 'dart:io';

void main() {
  var jalan = true;

  List waitinglist=[];

  // Map POS = {'POS A':Null, 'POS B':Null, 'POS C':Null };
  Map POSA = {'plat':null};
  Map POSB = {'plat':null};
  Map POSC = {'plat':null};

  tambahlist() {
    //jika ketiga pos lagi kosong maka masuk dulu, jika sebuah pos penuh maka akan ke waiting list
    stdout.write('Plat Kendaraan:');
    var plat = (stdin.readLineSync()!);
    
    if (POSA['plat'] == null ) {
      POSA['plat'] = plat;
    } else if (POSB['plat'] == null) {
        POSB['plat'] = plat;
      } else if (POSC['plat'] == null) {
        POSC['plat'] = plat;
      } else {
        waitinglist.add(plat);
      }
    }
  
    
    
  

  showlist(){
    //perulangan pada list for, for in, for each
    for (var i = 0; i < waitinglist.length; i++) {
        print('Waiting List ke-${i+1}: ${waitinglist[i]}'); 
      }
      
    // for (var i in waitinglist) {
    //   print('Waiting List: $i');
    // }

    // waitinglist.forEach((plat) => print('Waiting List: $plat'));
    }

  showpos(){
  //tampil pos A,B,C
   print(POSA['plat']);
   print(POSB['plat']);
   print(POSC['plat']);
  }

  finishpos(){
    //tanya user, hapus pos berapa?
    //jika pos A dihapus
    //maka pos A jadikan null, pos A diisi dengan list pertama, list pertama dihapus
    //jika pos B dihapus
    //maka pos C jadikan null, pos A diisi dengan list pertama, list pertama dihapus
    stdout.write('Pilih POS yang selesai (A/B/C): ');
    var pilihan = stdin.readLineSync()?.toUpperCase(); //Mengubah input menjadi huruf kapital

    Map? targetPOS;
    String namaPOS = ''; 

    if (pilihan == 'A') {
      targetPOS = POSA;
      namaPOS = 'POS A';
    } else if (pilihan == 'B') {
      targetPOS = POSB;
      namaPOS = 'POS B';
    } else if (pilihan == 'C') {
      targetPOS = POSC;
      namaPOS = 'POS C';
    } else {
      print('Pilihan POS tidak valid.');
      return;
    }

    if (targetPOS['plat'] == null) {
      print('$namaPOS memang sedang kosong.');
      return;
    }

    print('Pencucian kendaraan di $namaPOS (${targetPOS['plat']}) telah selesai.');

    // Cek apakah ada antrian di waitinglist
    if (waitinglist.isNotEmpty) {
      // Ambil elemen pertama dari waitinglist dan hapus dari list
      var platberikutnya = waitinglist.removeAt(0);
      targetPOS['plat'] = platberikutnya;
      print('Kendaraan $platberikutnya dari waiting list masuk ke $namaPOS.');
    } else {
      targetPOS['plat'] = null;
      print('$namaPOS sekarang kosong.');
    }
  }


  keluar(){
    //tombol keluar
    exit(0);
    }

  while(jalan==true){
    //tampil menu dulu
    //tanya user pilih menu mana
    //switch case
    //case 1 -> tampil menu
    //case 2 -> lihat waiting list
    //case 3 -> lihat pos
    //case 4 -> selesaikan pos
    //case 5 -> keluar dari aplikasi

    print('\n================================');
    print('Sistem Cuci Mobil');
    print('================================');
    print('1. Tambah Waiting list');
    print('2. Lihat Waiting List');
    print('3. Lihat POS');
    print('4. Selesaikan POS');
    print('5. Keluar');

    stdout.write('Pilih menu (1/2/3/4/5):');
    int pilihan = int.parse(stdin.readLineSync()!);

    switch(pilihan) {
      case 1 :
      tambahlist();
      case 2 :
      showlist();
      case 3 :
      showpos();
      case 4 :
      finishpos();
      case 5 :
      keluar();
    }
  }

  
}




// import 'dart:io';

// void main() {
//   List<Map<String, dynamic>> stokGudang = [
//     {
//       'nama': 'Gatsby',
//       'lusin': 0,
//       'pcs': 0,
//       'kotak': 0,
//     },
//     {
//       'nama': 'Pixy',
//       'lusin': 0,
//       'pcs': 0,
//       'kotak': 0,
//     },
//     {
//       'nama': 'Darlie',
//       'lusin': 0,
//       'pcs': 0,
//       'kotak': 0,
//     },
//   ];

//   while (true) {
//     print('\n===== MENU STOK GUDANG =====');
//     print('1. Input Stok');
//     print('2. Cek Stok');
//     print('3. Kurangi Stok');
//     print('4. Keluar');
//     stdout.write('Pilih menu: ');

//     int pilihan = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//     if (pilihan == 1) {
//       inputStok(stokGudang);
//     } else if (pilihan == 2) {
//       cekStok(stokGudang);
//     } else if (pilihan == 3) {
//       kurangiStok(stokGudang);
//     } else if (pilihan == 4) {
//       print('Program selesai.');
//       break;
//     } else {
//       print('Pilihan tidak valid!');
//     }
//   }
// }

// void tampilkanBarang(List<Map<String, dynamic>> stokGudang) {
//   print('\nDaftar Barang:');
//   for (int i = 0; i < stokGudang.length; i++) {
//     print('${i + 1}. ${stokGudang[i]['nama']}');
//   }
// }

// void inputStok(List<Map<String, dynamic>> stokGudang) {
//   tampilkanBarang(stokGudang);

//   stdout.write('Pilih barang: ');
//   int nomor = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   if (nomor < 1 || nomor > stokGudang.length) {
//     print('Barang tidak ditemukan!');
//     return;
//   }

//   var barang = stokGudang[nomor - 1];

//   stdout.write('Masukkan jumlah kotak: ');
//   int kotak = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   stdout.write('Masukkan jumlah lusin: ');
//   int lusin = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   stdout.write('Masukkan jumlah pcs: ');
//   int pcs = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   if (kotak < 0 || lusin < 0 || pcs < 0) {
//     print('Jumlah tidak boleh negatif!');
//     return;
//   }

//   barang['kotak'] += kotak;
//   barang['lusin'] += lusin;
//   barang['pcs'] += pcs;

//   print('Stok ${barang['nama']} berhasil ditambahkan!');
// }

// void cekStok(List<Map<String, dynamic>> stokGudang) {
//   print('\n===== DAFTAR STOK GUDANG =====');

//   for (var barang in stokGudang) {
//     print('\nNama Barang: ${barang['nama']}');
//     print('Kotak: ${barang['kotak']}');
//     print('Lusin: ${barang['lusin']}');
//     print('Pcs: ${barang['pcs']}');
//   }
// }

// void kurangiStok(List<Map<String, dynamic>> stokGudang) {
//   tampilkanBarang(stokGudang);

//   stdout.write('Pilih barang: ');
//   int nomor = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   if (nomor < 1 || nomor > stokGudang.length) {
//     print('Barang tidak ditemukan!');
//     return;
//   }

//   var barang = stokGudang[nomor - 1];

//   stdout.write('Kurangi berapa kotak? ');
//   int kotak = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   stdout.write('Kurangi berapa lusin? ');
//   int lusin = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   stdout.write('Kurangi berapa pcs? ');
//   int pcs = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

//   if (kotak < 0 || lusin < 0 || pcs < 0) {
//     print('Jumlah tidak boleh negatif!');
//     return;
//   }

//   // Menghitung total stok dalam pcs
//   int totalStok =
//       (barang['kotak'] * 12 * 12) +
//       (barang['lusin'] * 12) +
//       barang['pcs'];

//   // Menghitung jumlah yang akan dikurangi
//   int totalKurang =
//       (kotak * 12 * 12) +
//       (lusin * 12) +
//       pcs;

//   if (totalKurang > totalStok) {
//     print('Stok tidak cukup! Pengurangan dibatalkan.');
//     return;
//   }

//   // Mengubah stok menjadi satuan pcs
//   totalStok -= totalKurang;

//   // Mengubah kembali ke kotak, lusin, dan pcs
//   barang['kotak'] = totalStok ~/ 144;
//   int sisa = totalStok % 144;

//   barang['lusin'] = sisa ~/ 12;
//   barang['pcs'] = sisa % 12;

//   print('Stok ${barang['nama']} berhasil dikurangi!');
// }
