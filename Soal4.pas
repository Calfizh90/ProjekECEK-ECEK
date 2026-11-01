program rataRatanilaiAkhir;
uses crt;
var
NilaiUTS, NilaiQuiz, NilaiTugas, NilaiUAS, NilairataRata: array[1..5] of real; 
{Sesuai dengan soal yaitu jumlah mahasiswa berada dalam rentang
1 <= n <= 5, maka array dibuat sebanyak 5 elemen}
i, n, kode: integer;
inputTeks: string;

begin
clrscr;
writeln('========= PROGRAM MENGHITUNG NILAI AKHIR MAHASISWA =========');
writeln('               DAN STATUS KELULUSAN MAHASISWA               ');

repeat // looping untuk memastikan input jumlah mahasiswa valid
    write('Masukkan Jumlah Mahasiswa: ');
    readln(inputTeks);

    n := 0;
    val(inputTeks, n, kode);
    if kode <> 0 then
    writeln('Input harus berupa bilangan bulat!') //Jika input tipe data selain integer, maka akan ngulang input sampai benar
    else if (n < 1) or (n > 5) then
    writeln('Jumlah mahasiswa harus antara 1 sampai 5.'); //Jika input integer negatif, nol, atau lebih dari 5, maka akan ngulang input sampai benar
until (kode = 0) and (n >= 1) and (n <= 5);

for i := 1 to n do
begin
    writeln('Mahasiswa ke-', i); //menampilkan mahasiswa ke-i

{Setiap jenis nilai menggunakan repeat-until tersendiri. 
Dengan begitu, jika satu input tidak valid (bukan angka atau di luar
rentang 0 sampai 100), hanya input tersebut yang diminta ulang.} 

    repeat {Ulangi input Tugas sampai berupa angka dalam rentang 0-100.}
    write('Masukkan Nilai Tugas: '); 
    readln(inputTeks);
    NilaiTugas[i] := 0;
    val(inputTeks, NilaiTugas[i], kode);
    if (kode <> 0) or (NilaiTugas[i] < 0) or (NilaiTugas[i] > 100) then
        writeln('Nilai harus berupa angka antara 0 sampai 100!');
    until (kode = 0) and (NilaiTugas[i] >= 0) and (NilaiTugas[i] <= 100);

    repeat {Ulangi input Quiz sampai berupa angka dalam rentang 0-100.}
    write('Masukkan Nilai Quiz: ');
    readln(inputTeks);
    NilaiQuiz[i] := 0;
    val(inputTeks, NilaiQuiz[i], kode);
    if (kode <> 0) or (NilaiQuiz[i] < 0) or (NilaiQuiz[i] > 100) then
        writeln('Nilai harus berupa angka antara 0 sampai 100!');
    until (kode = 0) and (NilaiQuiz[i] >= 0) and (NilaiQuiz[i] <= 100);

    repeat {Ulangi input UTS sampai berupa angka dalam rentang 0-100.}
    write('Masukkan Nilai UTS: ');
    readln(inputTeks);
    NilaiUTS[i] := 0;
    val(inputTeks, NilaiUTS[i], kode);
    if (kode <> 0) or (NilaiUTS[i] < 0) or (NilaiUTS[i] > 100) then
        writeln('Nilai harus berupa angka antara 0 sampai 100!');
    until (kode = 0) and (NilaiUTS[i] >= 0) and (NilaiUTS[i] <= 100);

    repeat {Ulangi input UAS sampai berupa angka dalam rentang 0-100.}
    write('Masukkan Nilai UAS: ');
    readln(inputTeks);
    NilaiUAS[i] := 0;
    val(inputTeks, NilaiUAS[i], kode);
    if (kode <> 0) or (NilaiUAS[i] < 0) or (NilaiUAS[i] > 100) then
        writeln('Nilai harus berupa angka antara 0 sampai 100!');
    until (kode = 0) and (NilaiUAS[i] >= 0) and (NilaiUAS[i] <= 100);

    NilairataRata[i] := (NilaiTugas[i] + NilaiQuiz[i] + NilaiUTS[i] + NilaiUAS[i]) / (4); //Menghitung nilai rata-rata mahasiswa ke-i
    writeln('Nilai Rata-Rata Mahasiswa ke-', i, ': ', NilairataRata[i]:0:2);
end;

writeln('===== HASIL ====='); //Menampilkan hasil perhitungan nilai mahasiswa, nilai rata-rata dan status kelulusannya
for i := 1 to n do
begin
    writeln('Mahasiswa ke-', i);
    writeln('Nilai Tugas: ', NilaiTugas[i]:0:0);
    writeln('Nilai Quiz : ', NilaiQuiz[i]:0:0);
    writeln('Nilai UTS  : ', NilaiUTS[i]:0:0);
    writeln('Nilai UAS  : ', NilaiUAS[i]:0:0);
    writeln('Nilai Rata-Rata: ', NilairataRata[i]:0:2);

    if NilairataRata[i] >= 70 then
    writeln('Status: LULUS')
    else
    writeln('Status: TIDAK LULUS');
end;
end.