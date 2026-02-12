program ATMLengkap;
uses crt;

var
  pin, pinBaru, saldo, pilihan: longint;
  tarik, setor, transfer: longint;
  i: integer;
  benarPIN: boolean;

procedure StrukTransaksi(jenis: string; jumlah: longint);
begin
  writeln;
  writeln('===== STRUK TRANSAKSI =====');
  writeln('Jenis Transaksi : ', jenis);
  writeln('Jumlah          : Rp ', jumlah);
  writeln('Sisa Saldo      : Rp ', saldo);
  writeln('===========================');
end;

begin
  clrscr;
  saldo := 1000000;     { saldo awal }
  pin := 1234;          { PIN awal }
  benarPIN := false;

  writeln('===== SELAMAT DATANG DI ATM =====');

  { Login PIN maksimal 3 kali }
  for i := 1 to 3 do
  begin
    write('Masukkan PIN Anda: ');
    readln(pinBaru);

    if pinBaru = pin then
    begin
      benarPIN := true;
      break;
    end
    else
      writeln('PIN salah! Sisa percobaan: ', 3 - i);
  end;

  if not benarPIN then
  begin
    writeln('Kartu diblokir!');
    readln;
    exit;
  end;

  repeat
    clrscr;
    writeln('===== MENU ATM =====');
    writeln('1. Cek Saldo');
    writeln('2. Tarik Tunai');
    writeln('3. Setor Tunai');
    writeln('4. Transfer');
    writeln('5. Ganti PIN');
    writeln('6. Keluar');
    write('Pilih menu (1-6): ');
    readln(pilihan);

    while (pilihan < 1) or (pilihan > 6) do
    begin
      writeln('Menu tidak valid!');
      write('Pilih menu (1-6): ');
      readln(pilihan);
    end;

    case pilihan of

      1: begin
           writeln('Saldo Anda: Rp ', saldo);
         end;

      2: begin
           write('Masukkan jumlah tarik: ');
           readln(tarik);

           if (tarik <= 0) then
             writeln('Jumlah tidak valid!')
           else if (tarik > saldo) then
             writeln('Saldo tidak cukup!')
           else
           begin
             saldo := saldo - tarik;
             writeln('Tarik tunai berhasil!');
             StrukTransaksi('Tarik Tunai', tarik);
           end;
         end;

      3: begin
           write('Masukkan jumlah setor: ');
           readln(setor);

           if (setor <= 0) then
             writeln('Jumlah tidak valid!')
           else
           begin
             saldo := saldo + setor;
             writeln('Setor tunai berhasil!');
             StrukTransaksi('Setor Tunai', setor);
           end;
         end;

      4: begin
           write('Masukkan jumlah transfer: ');
           readln(transfer);

           if (transfer <= 0) then
             writeln('Jumlah tidak valid!')
           else if (transfer > saldo) then
             writeln('Saldo tidak cukup!')
           else
           begin
             saldo := saldo - transfer;
             writeln('Transfer berhasil!');
             StrukTransaksi('Transfer', transfer);
           end;
         end;

      5: begin
           write('Masukkan PIN baru: ');
           readln(pinBaru);

           if pinBaru < 1000 then
             writeln('PIN minimal 4 digit!')
           else
           begin
             pin := pinBaru;
             writeln('PIN berhasil diganti!');
           end;
         end;

      6: begin
           writeln('Terima kasih telah menggunakan ATM.');
         end;

    end;

    if pilihan <> 6 then
    begin
      writeln;
      writeln('Tekan ENTER untuk kembali ke menu...');
      readln;
    end;

  until pilihan = 6;

  readln;
end.
