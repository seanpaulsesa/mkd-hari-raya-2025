program MiniProjectKasir;

uses crt;
var
  i, jumlahBarang: integer;
  harga, total, bayar: longint;
  pilih: char;

begin
  clrscr;
  total := 0;

  writeln('=== PROGRAM KASIR SEDERHANA ===');

  { FOR TO DO }
  write('Masukkan jumlah barang: ');
  readln(jumlahBarang);

  for i := 1 to jumlahBarang do
  begin
    write('Masukkan harga barang ke-', i, ': ');
    readln(harga);
    total := total + harga;
  end;

  writeln('Total belanja: Rp ', total);

  { WHILE DO }
  write('Masukkan uang pembayaran: ');
  readln(bayar);

  while bayar < total do
  begin
    writeln('Uang kurang! Masukkan ulang.');
    write('Masukkan uang pembayaran: ');
    readln(bayar);
  end;

  writeln('Kembalian: Rp ', bayar - total);

  { REPEAT UNTIL }
  repeat
    write('Ingin transaksi lagi? (y/t): ');
    readln(pilih);
  until (pilih = 'y') or (pilih = 't');

  writeln('Terima kasih!');
  readln;
end.
