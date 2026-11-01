program pengurutanNilaiUAS;
uses crt;
var
nilaiUAS: array[1..10] of integer; // Sesuai dengan jumlah mahasiswa yang diinputkan, yaitu rentang 1 <= n <= 10 
nomorMahasiswa: array[1..10] of integer; // Menyimpan nomor mahasiswa sesuai dengan indeksnya
i, j, sementara, k, n, kode, nomorSementara: integer;
inputTeks: string;

begin
    writeln ('======= Pengurutan Nilai UAS Mahasiswa (Bubble Sort) =======');
    writeln ('========== Dari yang terkecil hingga terbesar =========');
    repeat
    write('Masukkan jumlah mahasiswa: '); //Input jumlah mahasiswa yang valid antara rentang 1 sampai 10
    readln(inputTeks);

    n := 0; // Inisialisasi n dengan 0 sebelum val mencoba mengubah teks menjadi angka
    val(inputTeks, n, kode);
    if (kode <> 0) then
    begin
        writeln('Input harus berupa bilangan bulat!'); //Jika input tipe data selain integer, maka akan ngulang input sampai benar;
    end
    else if (n < 1) or (n > 10) then
        writeln('Jumlah mahasiswa harus antara 1 sampai 10'); //Jika input integer negatif, nol, atau lebih dari 10, maka akan ngulang input sampai benar
    until (kode = 0) and (n >= 1) and (n <= 10);

    for i := 1 to n do //Input jumlah mahasiswa yang valid antara rentang 1 sampai 10
    begin
    repeat
    write('Nilai UAS Mahasiswa ke-', i, ': '); //Masukkan Nilai UAS mahasiswa rentang 0-100
    readln(inputTeks);

nilaiUAS[i] := 0; // Inisialisasi nilaiUAS[i] dengan 0 sebelum val mencoba mengubah teks menjadi angka
val(inputTeks, nilaiUAS[i], kode);
if kode <> 0 then
    writeln('Input harus berupa bilangan bulat!') //Jika input tipe data selain integer, maka akan ngulang input sampai benar
else if (nilaiUAS[i] < 0) or (nilaiUAS[i] > 100) then //Rentang nilai UAS yang valid adalah 0 sampai 100
    writeln('Nilai harus antara 0 sampai 100!');
until (kode = 0) and (nilaiUAS[i] >= 0) and (nilaiUAS[i] <= 100);
    nomorMahasiswa[i] := i; // Menyimpan nomor asal mahasiswa sebelum pengurutan
end;

//Terjadinya proses algoritma Bubble Sort
for i := 1 to n - 1 do //Mengulang proses pengurutan sampai semua nilai tersusun
begin
    for j := 1 to n - i do //Membandingkan nilai yang bersebelahan pada setiap putaran
    begin
        if nilaiUAS[j] > nilaiUAS[j + 1] then //Tukar jika nilai kiri lebih besar
        begin
            sementara := nilaiUAS[j];
            nilaiUAS[j] := nilaiUAS[j + 1];
            nilaiUAS[j + 1] := sementara;
            
            nomorSementara := nomorMahasiswa[j]; //Menyimpan nomor mahasiswa saat diurutkan agar tidak bingung Nilai UAS dengan milik mahasiswa yang mana
            nomorMahasiswa[j] := nomorMahasiswa[j + 1];
            nomorMahasiswa[j + 1] := nomorSementara;
        end;
    end;
end;

writeln('=====Nilai UAS MAHASISWA SETELAH DIURUTKAN=====');
for k := 1 to n do //Output nilai UAS mahasiswa setelah diurutkan dari yang terkecil hingga terbesar
begin
    writeln('Mahasiswa ', nomorMahasiswa[k], ': ', nilaiUAS[k]); //Menampilkan Nomor Mahasiswa sesuai dengan Nilai UAS mereka setelah diurutkan
end;
end.