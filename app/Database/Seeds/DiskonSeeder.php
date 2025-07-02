<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use CodeIgniter\I18n\Time;

class DiskonSeeder extends Seeder
{
    public function run()
    {
        $data = [];
        $currentDate = Time::now();
        $data[] = [
            'tanggal'    => $currentDate->toDateString(),
            'nominal'    => rand(5000, 50000), // Nominal acak antara 5000 dan 50000
            'created_at' => $currentDate->toDateTimeString(),
            'updated_at' => $currentDate->toDateTimeString(),
        ];
        // Tambahkan data diskon untuk 9 hari selanjutnya
        for ($i = 1; $i <= 9; $i++) {
            $futureDate = $currentDate->addDays($i);
            $data[] = [
                'tanggal'    => $futureDate->toDateString(),
                'nominal'    => rand(5000, 50000), // Nominal acak
                'created_at' => $futureDate->toDateTimeString(),
                'updated_at' => $futureDate->toDateTimeString(),
            ];
        }
        $this->db->table('diskon')->insertBatch($data);
    }
}
