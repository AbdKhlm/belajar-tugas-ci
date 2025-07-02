<?php

namespace App\Models;

use CodeIgniter\Model;

class DiskonModel extends Model
{
    protected $table = 'diskon';
    protected $primaryKey = 'id';
    protected $allowedFields = ['tanggal', 'nominal']; // created_at dan updated_at tidak perlu di allowedFields jika useTimestamps true

    protected $useTimestamps = true; // Tambahkan ini
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $dateFormat    = 'datetime'; // Pastikan format sesuai dengan tipe data di DB
}
