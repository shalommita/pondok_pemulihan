<?php
include 'koneksi.php';

$sql = "SELECT r.idKlien, 
               COUNT(CASE WHEN r.konflik = 'Ya' THEN 1 ELSE 0 END) AS Frekuensi,
               DATE_FORMAT(a.tanggalPencatatan, '%d/%m') AS waktuCatatFormatted2
               k.kegiatan,
               d.namaKlien
        FROM rekapkonflik r
        JOIN jadwalharian k ON r.idJadwal = k.idJadwal
        JOIN dataklien d ON r.idKlien = d.idKlien
        GROUP BY r.idKlien";

$result = mysqli_query($conn, $sql);

$data = array();

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = array(
            'idKlien' => $row['idKlien'],
            'tanggal' => $row['waktuCatatFormatted2'],
            'frekuensi' => $row['Frekuensi'],
            'kegiatan' => $row['kegiatan'],
            'namaKlien' => $row['namaKlien'],
        );
    }

    header('Content-Type: application/json');
    echo json_encode($data);
} else {
    echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
