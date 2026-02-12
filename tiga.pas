program ATMSederhana;
uses crt;

var
  pin, saldo, pilihan: LongInt;
  tarik, setor: LongInt;
  i: LongInt;
  benarPIN: boolean;

begin
  clrscr;
  saldo := 1000000;   { saldo awal 1 juta }
  benarPIN := false;

  writeln('===== ATM SEDERHANA =====');

  { Percobaan PIN maksimal 3 kali }
  for i := 1 to 3 do
  begin
    write('Masukkan PIN Anda: ');
    readln(pin);

    if pin = 1234 then
    begin
      benarPIN := true;
      break;
    end
    else
      writeln('PIN salah! Sisa percobaan: ', 3 - i);
  end;

  if not benarPIN then
  begin
    writeln('Akun diblokir karena 3 kali salah PIN!');
    readln;
    exit;
  end;

  { Menu ATM }
  repeat
    writeln;
    writeln('===== MENU ATM =====');
    writeln('1. Cek Saldo');
    writeln('2. Tarik Uang');
    writeln('3. Setor Uang');
    writeln('4. Keluar');
    write('Pilih menu (1-4): ');
    readln(pilihan);

    { Validasi pilihan }
    while (pilihan < 1) or (pilihan > 4) do
    begin
      writeln('Pilihan tidak valid!');
      write('Pilih menu (1-4): ');
      readln(pilihan);
    end;

    case pilihan of
      1: begin
           writeln('Saldo Anda: Rp ', saldo);
         end;

      2: begin
           write('Masukkan jumlah tarik: ');
           readln(tarik);

           if tarik <= 0 then
             writeln('Jumlah tarik tidak valid!')
           else if tarik > saldo then
             writeln('Saldo tidak cukup!')
           else
           begin
             saldo := saldo - tarik;
             writeln('Tarik berhasil!');
             writeln('Sisa saldo: Rp ', saldo);
           end;
         end;

      3: begin
           write('Masukkan jumlah setor: ');
           readln(setor);

           if setor <= 0 then
             writeln('Jumlah setor tidak valid!')
           else
           begin
             saldo := saldo + setor;
             writeln('Setor berhasil!');
             writeln('Saldo sekarang: Rp ', saldo);
           end;
         end;

      4: writeln('Terima kasih telah menggunakan ATM.');
    end;

  until pilihan = 4;

  readln;
end.
