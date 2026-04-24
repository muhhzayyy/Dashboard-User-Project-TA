class ApiService {
  // 1. METHOD LOGIN DUMMY
  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulasi loading API
    await Future.delayed(const Duration(seconds: 2));

    // Logika login sederhana (Hardcode)
    if (email == "user@gmail.com" && password == "user") {
      return {
        "status": "success",
        "message": "Login berhasil",
        "data": {"name": "Jokovic", "token": "token-rahasia-123"},
      };
    } else {
      throw Exception("Email atau password salah!");
    }
  }

  // 2. METHOD GET ITEMS DUMMY (Sesuai screenshot pertama)
  Future<List<Map<String, dynamic>>> getBorrowedItems() async {
    // Simulasi loading
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        "id": "1",
        "code": "#PJ-5001",
        "name": "Proyektor Epson EB-X400",
        "status": "Dikembalikan",
        "date": "25 Feb 2025",
        "inventory": "INV-PRO-01",
      },
      {
        "id": "2",
        "code": "#PJ-5002",
        "name": "Karpet musholla",
        "status": "Dipinjam",
        "date": "5 Mar 2025",
        "inventory": "INV-KRP-02",
      },
      {
        "id": "3",
        "code": "#PJ-5003",
        "name": "AC Portable 2 PK",
        "status": "Terlambat",
        "date": "1 Mar 2025",
        "inventory": "INV-AC-03",
      },
    ];
  }
}
