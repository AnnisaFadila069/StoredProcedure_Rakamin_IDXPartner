# Data Warehouse Stored Procedures

Repository ini berisi **stored procedure** berdasarkan study case perbankan pada IDX Partner X Rakamin.  

---

## 📌 Stored Procedures

### 1. DailyTransaction
**Kegunaan:**  
Menampilkan ringkasan transaksi harian dalam rentang tanggal tertentu. Hasilnya berisi jumlah transaksi dan total nominal per hari. Cocok digunakan tim reporting untuk melihat tren transaksi.

**Parameter:**
- `@start_date` → tanggal awal (DATE)
- `@end_date` → tanggal akhir (DATE)

**Output Columns:**
- `Date` → tanggal transaksi  
- `TotalTransactions` → jumlah transaksi pada tanggal tersebut  
- `TotalAmount` → total nominal transaksi pada tanggal tersebut  

**Contoh eksekusi:**
```sql
EXEC DailyTransaction '2025-01-01', '2025-01-31';
```

### 2. BalancePerCustomer
**Kegunaan:**  
Menampilkan saldo terkini untuk seorang nasabah berdasarkan transaksi yang dilakukan. Stored procedure ini memperhitungkan semua transaksi (deposit menambah saldo, transaksi lain mengurangi saldo) hanya untuk akun yang masih **active**. Cocok digunakan tim layanan nasabah untuk cek posisi saldo akhir.

**Parameter:**
- `@name` → nama customer (VARCHAR)

**Output Columns:**
- `CustomerName` → nama nasabah  
- `AccountType` → jenis rekening (saving/checking)  
- `Balance` → saldo awal (dari DimAccount)  
- `CurrentBalance` → saldo akhir (hasil perhitungan Balance ± transaksi)  

**Contoh eksekusi:**
```sql
EXEC BalancePerCustomer 'Shelly';
```