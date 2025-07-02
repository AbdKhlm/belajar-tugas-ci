<?php

namespace App\Controllers;

use App\Models\DiskonModel;
use CodeIgniter\Controller;
use CodeIgniter\I18n\Time;

class DiskonController extends BaseController
{
    protected $diskonModel;

    public function __construct()
    {
        $this->diskonModel = new DiskonModel();
        helper('number');
        if (session()->get('role') !== 'admin') {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
    public function index()
    {
        $data['diskon'] = $this->diskonModel->findAll();
        return view('v_diskon', $data);
    }

    public function create()
    {
        if ($this->request->getPost()) {
            $rules = [
                'tanggal' => [
                    'rules' => 'required|valid_date|is_unique[diskon.tanggal]',
                    'errors' => [
                        'is_unique' => 'Diskon untuk tanggal ini sudah ada.',
                        'valid_date' => 'Format tanggal tidak valid.',
                        'required' => 'Tanggal harus diisi.'
                    ]
                ],
                'nominal' => 'required|numeric|greater_than[0]',
            ];

            if ($this->validate($rules)) {
                $dataForm = [
                    'tanggal'    => $this->request->getPost('tanggal'),
                    'nominal'    => $this->request->getPost('nominal'),
                    'created_at' => Time::now()->toDateTimeString(),
                    'updated_at' => Time::now()->toDateTimeString(),
                ];
                $this->diskonModel->insert($dataForm);
                return redirect()->to(base_url('diskon'))->with('success', 'Data Diskon Berhasil Ditambahkan');
            } else {
                return redirect()->back()->withInput()->with('failed', $this->validator->listErrors());
            }
        }

        return redirect()->to(base_url('diskon'));
    }

    public function edit($id)
    {
        $diskon = $this->diskonModel->find($id);
        if (!$diskon) {
            return redirect()->to(base_url('diskon'))->with('failed', 'Data Diskon Tidak Ditemukan');
        }
        if ($this->request->getPost()) {
            $rules = [
                'nominal' => 'required|numeric|greater_than[0]',
            ];
            if ($this->validate($rules)) {
                $dataForm = [
                    'nominal'    => $this->request->getPost('nominal'),
                    'updated_at' => Time::now()->toDateTimeString(),
                ];
                $this->diskonModel->update($id, $dataForm);
                return redirect()->to(base_url('diskon'))->with('success', 'Data Diskon Berhasil Diubah');
            } else {
                return redirect()->back()->withInput()->with('failed', $this->validator->listErrors());
            }
        }

        return redirect()->to(base_url('diskon'));
    }
    public function delete($id)
    {
        $diskon = $this->diskonModel->find($id);
        if (!$diskon) {
            return redirect()->to(base_url('diskon'))->with('failed', 'Data Diskon Tidak Ditemukan');
        }
        $this->diskonModel->delete($id);
        return redirect()->to(base_url('diskon'))->with('success', 'Data Diskon Berhasil Dihapus');
    }
}
