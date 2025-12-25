try:
    nilai = int(input("Masukkan nilai: "))

    if nilai >= 85:
        print("Nilai A")
    elif nilai >= 70:
        print("Nilai B")
    else:
        print("Nilai C")

except ValueError:
    print("Input harus berupa angka!")
